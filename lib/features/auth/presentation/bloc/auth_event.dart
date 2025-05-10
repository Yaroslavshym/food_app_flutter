part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginPressed extends AuthEvent {}

final class AuthGoLoginPressed extends AuthEvent {}

final class AuthGoRegisterPressed extends AuthEvent {}

final class AuthRegisterPressed extends AuthEvent {
  final BuildContext context;

  AuthRegisterPressed({required this.context});
}

final class AuthGooglePressed extends AuthEvent {}

final class AuthPasswordValidation extends AuthEvent {}

final class AuthEmailValidation extends AuthEvent {
  final bool isRegister;
  AuthEmailValidation({required this.isRegister});
}

final class AuthNameValidation extends AuthEvent {}

final class AuthTogglePrivacyAgree extends AuthEvent {
  final bool newIsAgree;
  AuthTogglePrivacyAgree({required this.newIsAgree});
}

final class AuthTextControllerChange extends AuthEvent {
  final String controllerName;
  final String controllerText;
  AuthTextControllerChange({
    required this.controllerName,
    required this.controllerText,
  });
}
