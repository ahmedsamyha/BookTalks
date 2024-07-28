import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/home/presentation/views/notes_view.dart';

import '../../data/data_source/firestore_cubit/firestore_cubit.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView(
      {super.key,
      required this.noteID,
      required this.oldTitle,
      required this.oldContent,
      required this.categoryID});
  final String noteID;
  final String categoryID;
  final String oldTitle;
  final String oldContent;
  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  @override
  Widget build(BuildContext context) {
    var noteNewTitleController = TextEditingController();
    var noteNewContentController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    setState(() {
      noteNewTitleController.text = widget.oldTitle;
      noteNewContentController.text = widget.oldContent;
    });
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
                    BlocProvider.of<FireStoreCubit>(context).updateNote(
                        categoryID: widget.categoryID,
                        noteID: widget.noteID,
                        noteTitle: noteNewTitleController.text,
                        noteContent: noteNewContentController.text);
                    Get.to(() => NotesView(docId: widget.categoryID));
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
                  controller: noteNewTitleController,
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
                  controller: noteNewContentController,
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
