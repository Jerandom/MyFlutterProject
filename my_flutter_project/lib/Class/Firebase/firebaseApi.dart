import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseApi {
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      // Trigger email and password sign-in
      final UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Firebase sign in failed
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

    return null;
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      // Create a new user
      UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Firebase create account failed
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain the Google Sign-In authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the authentication details
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential in Firebase
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Google Sign-In Error: $e");
    }

    return null;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
