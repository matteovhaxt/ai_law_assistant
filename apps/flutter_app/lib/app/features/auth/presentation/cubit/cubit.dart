import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/features/auth/data/repositories/firebase_auth.dart';
import 'package:flutter_app/core/core.dart';

part 'cubit.g.dart';
part 'cubit.freezed.dart';

part 'state.dart';

class AuthCubit extends Cubit<AuthState> with HydratedMixin<AuthState> {
  AuthCubit() : super(const AuthState());

  final repository = AuthRepository();

  User? get currentUser => repository.currentUser;

  Future<void> createAccountWithEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      final User? user = await repository.createAccountWithEmail(
        email: email,
        password: password,
      );
      if (user != null) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: true,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.register.weak-password'.tr(),
            ),
          ),
        );
      }
      if (e.code == 'email-already-in-use') {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.register.email-already-in-use'.tr(),
            ),
          ),
        );
      } else {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.unkown-error'.tr(),
            ),
          ),
        );
      }
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  Future<void> signInWithEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      final User? user = await repository.signInWithEmail(
        email: email,
        password: password,
      );
      if (user != null) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: true,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.login.user-not-found'.tr(),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.login.wrong-password'.tr(),
            ),
          ),
        );
      } else {
        context.messenger.showSnackBar(
          SnackBar(
            content: Text(
              'auth.unkown-error'.tr(),
            ),
          ),
        );
      }
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      await repository.signOut();
      emit(
        state.copyWith(
          isAuthenticated: false,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  Future<void> deleteAccount() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      await repository.deleteAccount();
      emit(
        state.copyWith(
          isAuthenticated: false,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
