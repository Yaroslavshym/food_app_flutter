import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repository_impl/google_auth_repository_impl.dart';

class GoogleAuthUseCase {
  Future<UserCredential> signInWithGoogle() async {
    return GoogleAuthRepositoryImpl().signInWithGoogle();
  }

  Future<void> signOutFromGoogle() async {
    await GoogleAuthRepositoryImpl().signOutWithGoogle();
  }
}
