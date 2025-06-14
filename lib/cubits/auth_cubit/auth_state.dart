part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}




final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errorMessage;
  RegisterFailureState({required this.errorMessage});
}
