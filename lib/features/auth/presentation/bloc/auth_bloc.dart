import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_app_flutter/features/auth/domain/usecases/email_auth_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // email field
  final TextEditingController emailController = TextEditingController();
  bool isEmailValidated = true;
  // name field
  final TextEditingController nameController = TextEditingController();
  bool isNameValidated = true;
  // password field
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordValidated = true;
  List<String> passwordControllerProblems = [];

  bool obscurePasswordControllerText = true;
  // privacy terms checkbox
  bool isTermsAgreed = false;

  AuthBloc() : super(AuthLoginState()) {
    // log in page
    on<AuthLoginPressed>(
      (
        event,
        emit,
      ) async {
        emit(AuthLoadingState());
        try {
          await EmailAuthUseCase().signIn(
            emailAddress: emailController.text,
            password: passwordController.text,
          );
          emit(AuthLoadedState());
        } catch (e) {
          emit(AuthErrorState());
        }
      },
    );
    on<AuthGoRegisterPressed>((
      event,
      emit,
    ) {
      emit(AuthRegisterState());
    });
    // register page
    on<AuthRegisterPressed>(
      (
        event,
        emit,
      ) async {
        emit(AuthLoadingState());

        try {
          await EmailAuthUseCase().signUp(
            emailAddress: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          );
          emit(AuthLoadedState());
        } catch (e) {
          emit(AuthErrorState());
        }
      },
    );
    on<AuthGoLoginPressed>((
      event,
      emit,
    ) {
      emit(AuthLoginState());
    });
    // google
    on<AuthGooglePressed>((
      event,
      emit,
    ) {
      emit(AuthLoadingState());
    });
    // privacy terms checkbox
    on<AuthTogglePrivacyAgree>((
      event,
      emit,
    ) {
      isTermsAgreed = event.newIsAgree;
      emit(AuthRegisterState());
    });
    // all controllers
    on<AuthTextControllerChange>((
      event,
      emit,
    ) {
      if (event.controllerName == 'name') {
        nameController.text = event.controllerText;
      } else if (event.controllerName == 'password') {
        passwordController.text = event.controllerText;
      } else if (event.controllerText == 'email') {
        emailController.text = event.controllerText;
      }
    });
    // controller validation
    on<AuthPasswordValidation>((
      event,
      emit,
    ) {
      passwordControllerProblems = EmailAuthUseCase()
          .passwordValidation(password: passwordController.text);
      isPasswordValidated = passwordControllerProblems.isEmpty;
      emit(AuthRegisterState());
    });
    on<AuthEmailValidation>((
      event,
      emit,
    ) {
      isEmailValidated = EmailAuthUseCase()
          .emailValidation(emailAddress: emailController.text);
      emit(AuthRegisterState());
    });
    on<AuthNameValidation>((
      event,
      emit,
    ) {
      isNameValidated = nameController.text.length > 2;
      emit(AuthRegisterState());
    });
  }
}
