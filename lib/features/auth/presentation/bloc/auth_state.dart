part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

// log in page
final class AuthLoginState extends AuthState {}

// reset password login page
final class AuthResetPasswordState extends AuthState {}

final class AuthResetPasswordLoadingState extends AuthState {}

// register page
final class AuthRegisterState extends AuthState {}

// after login/register

final class AuthLoadingState extends AuthState {
  final AuthState previousState;
  AuthLoadingState({required this.previousState});
}

final class AuthErrorState extends AuthState {
  final String? bodyMessage;
  AuthErrorState({this.bodyMessage});
}

final class AuthLoadedState extends AuthState {}
