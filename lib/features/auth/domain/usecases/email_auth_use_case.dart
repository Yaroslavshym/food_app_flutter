import 'package:email_validator/email_validator.dart';

import '../../data/repository_impl/email_auth_repository_impl.dart';

class EmailAuthUseCase {
  bool emailValidation({
    required String emailAddress,
  }) {
    return EmailValidator.validate(emailAddress);
  }

  List<String> passwordValidation({
    required String password,
  }) {
    List<String> ans = [];
    if (password.length < 8) {
      ans.add('more letters');
    }
    if (!RegExp(r'[1-9]').hasMatch(password)) {
      ans.add('numbers');
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      ans.add('upper case letters');
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      ans.add('lower case letters');
    }
    return ans;
  }

  Future<bool> signUp({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    return await EmailAuthRepositoryImpl().signUp(
      emailAddress: emailAddress,
      password: password,
      name: name,
    );
  }

  Future<bool> signIn({
    required String emailAddress,
    required String password,
  }) async {
    return await EmailAuthRepositoryImpl().signIn(
      emailAddress: emailAddress,
      password: password,
    );
  }

  Future<void> signOut() async {}
}
