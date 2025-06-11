import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> userSignIn({
    required String email,
    required String password,

  }) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(errorMessage:  'Check your input data'));
    }
  }
}
