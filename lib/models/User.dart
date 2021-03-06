import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData with ChangeNotifier {
  static String userName = "";
  static String Email = "";
  bool isLoggingIn = false;

  static Future<void> setUserName() async {
    final currUser = await FirebaseAuth.instance.currentUser;
    if (currUser != null && userName.isEmpty) {
      final query = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currUser.uid)
          .get();
      userName = query.get('name') as String;
    } else {
      await FirebaseAuth.instance.signOut();
    }
  }

  static void setEmail(String email) {
    Email = email;
  }

  Future<bool> login({required String email, required String password}) async {
    isLoggingIn = true;
    notifyListeners();
    UserCredential userCredential;
    try {
      // ignore: unused_local_variable
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final query = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .get();
      userName = query.get('name') as String;
      Email = email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isLoggingIn = false;
        notifyListeners();
        print('No user found for that email.');
        throw ("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        isLoggingIn = false;
        notifyListeners();
        print('Wrong password provided for that user.');
        throw ("Wrong password provided for that user.");
      } else {
        isLoggingIn = false;
        notifyListeners();
        throw (e.message as String);
      }
    }
    // await userCredential.user!.reload();
    isLoggingIn = false;
    notifyListeners();
    return true;
  }

  Future<bool> signup(
      {required String name,
      required String email,
      required String password}) async {
    isLoggingIn = true;
    notifyListeners();
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
        'name': name,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoggingIn = false;
        notifyListeners();
        print('The password provided is too weak.');
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        isLoggingIn = false;
        notifyListeners();
        print('The account already exists for that email.');
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      isLoggingIn = false;
      notifyListeners();
      throw e;
    }
    userName = name;
    Email = email;
    isLoggingIn = false;
    notifyListeners();
    return true;
  }
}
