import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../States/fsUserAccountState.dart';

class FsUserAccountProvider extends StateNotifier<FsUserAccountState> {
  FsUserAccountProvider() : super(FsUserAccountState.initial());

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email, 
            password: password
        );

      // Update the state with the signed-in user
      state = state.copyWith(setUser: userCredential.user);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setErrorMsg('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setErrorMsg('Wrong password provided for that user.');
      } else {
        setErrorMsg('Failed with error: ${e.message}');
      }
    } catch (e) {
      setErrorMsg('An unknown error occurred: $e');
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email, 
            password: password
        );

      // Update the state with the newly created user
      state = state.copyWith(setUser: userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setErrorMsg('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setErrorMsg('The account already exists for that email.');
      } else {
        setErrorMsg('Error: ${e.message}');
      }
    } catch (e) {
      setErrorMsg('Error: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        setErrorMsg('Google Sign-In canceled.');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Update the state with the signed-in user
      state = state.copyWith(setUser: userCredential.user);
    } catch (e) {
      setErrorMsg("Google Sign-In Error: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();

      // Clear the user from the state
      state = state.copyWith(setUser: null);
    } catch (e) {
      setErrorMsg('Error signing out: $e');
    }
  }

  void setErrorMsg(String errorMsg) {
    state = state.copyWith(
      setErrorMsg: errorMsg
    );

    // Clear the error message after a delay
    Future.delayed(Duration(seconds: 3), () {
      clearErrorMsg();
    });
  }

  void clearErrorMsg() {
    state = state.copyWith(
      setErrorMsg: ""
    );
  }
}

final fsUserAccountProvider = StateNotifierProvider<FsUserAccountProvider, FsUserAccountState>((ref) {
  return FsUserAccountProvider();
});
