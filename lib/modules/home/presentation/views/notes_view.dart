import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';
import 'package:mytask/modules/home/presentation/widgets/add_note_view.dart';
import 'package:mytask/modules/home/presentation/widgets/edit_notes_view.dart';
import 'package:mytask/modules/home/presentation/widgets/note_item.dart';

import '../../../../utility/constants/colors.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key, required this.docId});
  final String docId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNoteView(docId: docId),
              transition: Transition.downToUp,
              duration: const Duration(milliseconds: 400));
        },
        backgroundColor: AppColors.kLightColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.offAll(const HomeView());
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Notes'),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            FireStoreCubit(GetCategoryInitialState())..getNotes(docID: docId),
        child: BlocBuilder<FireStoreCubit, FireStoreStates>(
          builder: (context, state) {
            var firestoreCubit = BlocProvider.of<FireStoreCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => NoteItem(
                  title: firestoreCubit.notes[index]['noteTitle'],
                  content: firestoreCubit.notes[index]['noteContent'],
                  onEditPressed: () {
                    Get.to(
                        () => EditNotesView(
                            categoryID: docId,
                            noteID: firestoreCubit.notes[index].id,
                            oldTitle: firestoreCubit.notes[index]['noteTitle'],
                            oldContent: firestoreCubit.notes[index]
                                ['noteContent']),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 700));
                  },
                  btnOkOnPress: () {
                    FirebaseFirestore.instance
                        .collection('category')
                        .doc(docId)
                        .collection('note')
                        .doc(firestoreCubit.notes[index].id)
                        .delete();
                    Get.offAll(NotesView(
                      docId: docId,
                    ));
                  },
                ),
                itemCount: firestoreCubit.notes.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
