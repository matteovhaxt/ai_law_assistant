import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepositoryInterface {
  User? get currentUser;

  Future<void> createAccountWithEmail({
    required String email,
    required String password,
  });
  Future<void> signInWithEmail({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> deleteAccount();
}
