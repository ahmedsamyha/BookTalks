import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';

class FireStoreCubit extends Cubit<FireStoreStates> {
  FireStoreCubit(super.initialState);

  List<QueryDocumentSnapshot> categories = [];
  List<QueryDocumentSnapshot> notes = [];
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');

  Future<void> addCategory({required String name, required String userID}) {
    emit(AddCategoryLoadingState());
    return category.add({
      'categoryName': name,
      'uid': userID,
    }).then((value) {
      emit(AddCategorySuccessState());
      print("Category Added");
    }).catchError((error) {
      emit(AddCategoryFailureState(errorMessage: error.toString()));
      print("Failed to add Category: $error");
    });
  }

  getCategories() async {
    emit(GetCategoryLoadingState());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('category')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    categories.addAll(querySnapshot.docs);
    emit(GetCategorySuccessState());
  }

  Future<void> updateCategory(
      {required String categoryID, required String categoryName}) async {
    emit(UpdateCategoryLoadingState());
    return await category
        .doc(categoryID)
        .update({'categoryName': categoryName}).then((value) {
      emit(UpdateCategorySuccessState());
      print("Category Updated");
    }).catchError((error) {
      emit(UpdateCategoryFailureState(errorMessage: error.toString()));
      print("Failed to update Category: $error");
    });
  }

  //==================================================================================
  //Notes

  Future<void> addNote(
      {required String title, required String content, required String docID}) {
    CollectionReference note = FirebaseFirestore.instance
        .collection('category')
        .doc(docID)
        .collection('note');
    emit(AddNoteLoadingState());
    return note.add({
      'noteTitle': title,
      'noteContent': content,
    }).then((value) {
      emit(AddCategorySuccessState());
      print("Note Added");
    }).catchError((error) {
      emit(AddCategoryFailureState(errorMessage: error.toString()));
      print("Failed to add Note: $error");
    });
  }

  getNotes({required String docID}) async {
    emit(GetNoteLoadingState());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('category')
        .doc(docID)
        .collection('note')
        .get();
    notes.addAll(querySnapshot.docs);
    emit(GetNoteSuccessState());
  }

  Future<void> updateNote(
      {required String categoryID,
      required String noteID,
      required String noteTitle,
      required String noteContent}) async {
    CollectionReference note = FirebaseFirestore.instance
        .collection('category')
        .doc(categoryID)
        .collection('note');
    emit(UpdateNoteLoadingState());
    return await note.doc(noteID).update(
        {'noteTitle': noteTitle, 'noteContent': noteContent}).then((value) {
      emit(UpdateNoteSuccessState());
      print("Note Updated");
    }).catchError((error) {
      emit(UpdateNoteFailureState(errorMessage: error.toString()));
      print("Failed to update Note: $error");
    });
  }
}
