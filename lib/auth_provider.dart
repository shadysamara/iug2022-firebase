import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:iug_firebase/firestore_provider.dart';
import 'package:iug_firebase/iug_user.dart';
import 'package:provider/provider.dart';

class AuthProvider {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> createNewAccount(IugUser iugUser) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: iugUser.email,
        password: iugUser.password,
      );

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  signOut() async {}
  forgetPassword(String email) async {}
}
