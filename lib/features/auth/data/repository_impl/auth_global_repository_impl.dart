import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository_abs/auth_global_repository_abs.dart';

class AuthGlobalRepositoryImpl implements AuthGlobalRepositoryAbs {
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
