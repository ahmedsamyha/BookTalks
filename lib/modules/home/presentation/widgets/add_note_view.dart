import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/presentation/views/notes_view.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key, required this.docId});
  final String docId;
  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    var noteTitleController = TextEditingController();
    var noteContentController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Add Note'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<FireStoreCubit>(context).addNote(
                        title: noteTitleController.text,
                        content: noteContentController.text,
                        docID: widget.docId);
                    Get.to(() => NotesView(docId: widget.docId));
                    noteContentController.clear();
                    noteTitleController.clear();
                  }
                },
                icon: const Icon(Icons.save)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: noteTitleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Place Enter the title';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black45),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: noteContentController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Place Enter the content';
                    }
                    return null;
                  },
                  maxLines: 15,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'enter your note here',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
