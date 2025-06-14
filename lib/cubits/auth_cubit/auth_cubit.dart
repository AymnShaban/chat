// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'auth_state.dart';
//
// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());
//
//   // Future<void> userSignIn({
//   //   required String email,
//   //   required String password,
//   // }) async {
//   //   emit(LoginLoadingState());
//   //   try {
//   //     UserCredential userCredential = await FirebaseAuth.instance
//   //         .signInWithEmailAndPassword(email: email, password: password);
//   //     emit(LoginSuccessState());
//   //   } catch (e) {
//   //     emit(LoginFailureState(errorMessage: 'Check your input data'));
//   //   }
//   // }
//
//   //.
//   //.
//   //
//   //.
//   //.
//
//   // Future<void> registerUser({
//   //   required String email,
//   //   required String password,
//   // }) async {
//   //   emit(RegisterLoadingState());
//   //   try {
//   //     UserCredential user = await FirebaseAuth.instance
//   //         .createUserWithEmailAndPassword(email: email, password: password);
//   //     emit(RegisterSuccessState());
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == 'weak-password') {
//   //       emit(
//   //         RegisterFailureState(
//   //           errorMessage: 'Weak Password \n Please try another one',
//   //         ),
//   //       );
//   //     } else if (e.code == 'email-already-in-use') {
//   //       emit(
//   //         RegisterFailureState(
//   //           errorMessage: 'Email is already in use \n please try another one ',
//   //         ),
//   //       );
//   //     }
//   //   } on Exception catch (e) {
//   //     emit(RegisterFailureState(errorMessage: e.toString()));
//   //   }
//   // }
// }
