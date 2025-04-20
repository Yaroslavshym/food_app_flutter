import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository_abs/google_auth_repository_abs.dart';
import '../data_sources/external/google_auth.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepositoryAbs {
  Future<UserCredential> signInWithGoogle() async {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   signOutWithGoogle();
    // }
    return RemoteGoogleAuth().signInWithGoogle();
  }

  Future<void> signOutWithGoogle() async {
    await RemoteGoogleAuth().signOutFromGoogle();
  }
}
