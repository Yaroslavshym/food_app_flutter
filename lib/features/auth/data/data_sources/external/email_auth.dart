import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RemoteEmailAuth {
  Future<bool> signUp(
      {required String emailAddress,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user is User) {
        user.updateDisplayName(name);
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ErrorDescription(
            'Failed to sign up!\n Your password is too weak!');
      } else if (e.code == 'email-already-in-use') {
        throw ErrorDescription(
            'Failed to sign up!\n This email is already used!');
      } else {
        throw ErrorDescription(
            'Failed to sign up!\nFirebaseAuthException\n$e\n${e.code}');
      }
    }
    return false;
  }

  Future<bool> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        throw ErrorDescription(
            'Failed to sign in!\nNo user found for that email!');
      } else if (e.code == 'wrong-password') {
        throw ErrorDescription(
            'Failed to sign in!\n Wrong password provided for that user!');
      } else {
        throw ErrorDescription(
            'Failed to sign in!\nFirebaseAuthException\n$e\n${e.code}');
      }

      // if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
      //   MyAlertDialog(
      //     context: context,
      //     text: 'Failed to sign in!\nNo user found for that email!',
      //     buttonText: 'OK',
      //   ).show();
      // } else if (e.code == 'wrong-password') {
      //   MyAlertDialog(
      //     context: context,
      //     text: 'Failed to sign in!\n Wrong password provided for that user!',
      //     buttonText: 'OK',
      //   ).show();
      // } else {
      //   MyAlertDialog(
      //     context: context,
      //     text: 'Failed to sign in!\nFirebaseAuthException\n$e\n${e.code}',
      //     buttonText: 'OK',
      //   ).show();
      // }
    }
    return false;
  }
}
