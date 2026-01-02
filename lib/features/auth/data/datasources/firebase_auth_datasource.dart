import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';

abstract class FirebaseAuthDataSource {
  Future<User?> signInWithGoogle();
  Future<void> signOut();
  User? getCurrentUser();
  Future<String?> getIdToken();
}

@LazySingleton(as: FirebaseAuthDataSource)
class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } catch (e) {
      throw AuthFailure(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      throw AuthFailure(e.toString());
    }
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  @override
  Future<String?> getIdToken() async {
    return _auth.currentUser?.getIdToken();
  }
}
