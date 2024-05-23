import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  const AuthService(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        throw AuthException('Nutzer wurde nicht gefunden!');
      } else if( e.code == 'wrong-password'){
        throw AuthException('Falsches Passwort!');
      } else {
        throw AuthException('Etwas ist schief gelaufen!');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception{
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}