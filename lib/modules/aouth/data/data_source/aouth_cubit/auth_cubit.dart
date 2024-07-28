import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState);
  late String errorMessage;

  Future<void> userCreate({
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState());
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
        print('The password provided is too weak.');
        print('*********************${e.code.toString()}');
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
        print('The account already exists for that email.');
        print('*********************${e.code.toString()}');
      } else {
        print('*********************${e.code.toString()}');
        errorMessage = 'UnKnown Error';
      }
    }
    emit(RegisterFailureState(errorMessage: errorMessage));
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
        print('*********************${e.code.toString()}');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
        print('*********************${e.code.toString()}');

        print('Wrong password provided for that user.');
      } else {
        print('*********************${e.code.toString()}');

        errorMessage = 'UnKnown Error';
      }

      emit(LoginFailureState(errorMessage: errorMessage));
    }
  }

  Future<void> userLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
