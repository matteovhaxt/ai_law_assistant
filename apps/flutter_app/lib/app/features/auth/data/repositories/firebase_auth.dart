import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/app/features/auth/domain/interfaces/firebase_auth.dart';

class AuthRepository implements AuthRepositoryInterface {
  final auth = FirebaseAuth.instance;

  @override
  User? get currentUser => auth.currentUser;

  @override
  Future<User?> createAccountWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await auth.currentUser?.delete();
  }
}
