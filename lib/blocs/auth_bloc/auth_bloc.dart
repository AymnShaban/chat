import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState() as AuthState);
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: event.email,
                password: event.password,
              );

          emit(LoginSuccessState() as AuthState);
        } catch (e) {
          emit(
            LoginFailureState(errorMessage: 'Check your input data')
                as AuthState,
          );
        }
      }
      if (event is RegisterEvent) {

        emit(RegisterLoadingState());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: event.email, password: event.password);
          emit(RegisterSuccessState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(
              RegisterFailureState(
                errorMessage: 'Weak Password \n Please try another one',
              ),
            );
          } else if (e.code == 'email-already-in-use') {
            emit(
              RegisterFailureState(
                errorMessage: 'Email is already in use \n please try another one ',
              ),
            );
          }
        } on Exception catch (e) {
          emit(RegisterFailureState(errorMessage: e.toString()));
        }
      }
    });
  }
}
