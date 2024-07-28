import "package:firebase_auth/firebase_auth.dart";

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // user sign-in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print(userCredentials);
  }

  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials;
    } catch (err) {
      throw err;
    }
  }

  // user sign-out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
