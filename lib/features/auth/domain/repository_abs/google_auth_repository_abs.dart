import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthRepositoryAbs {
  Future<UserCredential> signInWithGoogle();
  Future<void> signOutWithGoogle();
}
