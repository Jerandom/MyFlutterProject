import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Failed with error: ${e.message}');
      }
    } catch (e) {
      print('An unknown error occurred: $e');
    }
  }
}
