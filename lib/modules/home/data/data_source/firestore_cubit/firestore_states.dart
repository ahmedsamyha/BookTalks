abstract class FireStoreStates {}

class AddCategoryInitialState extends FireStoreStates {}

class AddCategoryLoadingState extends FireStoreStates {}

class AddCategorySuccessState extends FireStoreStates {}

class AddCategoryFailureState extends FireStoreStates {
  final String errorMessage;

  AddCategoryFailureState({required this.errorMessage});
}

class GetCategoryInitialState extends FireStoreStates {}

class GetCategoryLoadingState extends FireStoreStates {}

class GetCategorySuccessState extends FireStoreStates {}

class GetCategoryFailureState extends FireStoreStates {
  final String errorMessage;

  GetCategoryFailureState({required this.errorMessage});
}

class UpdateCategoryInitialState extends FireStoreStates {}

class UpdateCategoryLoadingState extends FireStoreStates {}

class UpdateCategorySuccessState extends FireStoreStates {}

class UpdateCategoryFailureState extends FireStoreStates {
  final String errorMessage;

  UpdateCategoryFailureState({required this.errorMessage});
}
//===================================================================

class AddNoteInitialState extends FireStoreStates {}

class AddNoteLoadingState extends FireStoreStates {}

class AddNoteSuccessState extends FireStoreStates {}

class AddNoteFailureState extends FireStoreStates {
  final String errorMessage;

  AddNoteFailureState({required this.errorMessage});
}

class GetNoteInitialState extends FireStoreStates {}

class GetNoteLoadingState extends FireStoreStates {}

class GetNoteSuccessState extends FireStoreStates {}

class GetNoteFailureState extends FireStoreStates {
  final String errorMessage;

  GetNoteFailureState({required this.errorMessage});
}

class UpdateNoteInitialState extends FireStoreStates {}

class UpdateNoteLoadingState extends FireStoreStates {}

class UpdateNoteSuccessState extends FireStoreStates {}

class UpdateNoteFailureState extends FireStoreStates {
  final String errorMessage;

  UpdateNoteFailureState({required this.errorMessage});
}
