import '../../domain/repository_abs/email_auth_repository_abs.dart';
import '../data_sources/external/email_auth.dart';

class EmailAuthRepositoryImpl implements EmailAuthRepositoryAbs {
  Future<bool> signUp({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    return await RemoteEmailAuth()
        .signUp(emailAddress: emailAddress, password: password, name: name);
  }

  Future<bool> signIn({
    required String emailAddress,
    required String password,
  }) async {
    return await RemoteEmailAuth()
        .signIn(emailAddress: emailAddress, password: password);
  }
}
