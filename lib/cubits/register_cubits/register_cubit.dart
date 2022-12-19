import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerWithAuth(
      String email, String password, BuildContext context) async {
    emit(RegisterLoading());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSucceess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(RegisterFailure(errorMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(RegisterFailure(errorMessage: 'Wrong password'));
      } else {
        emit(RegisterFailure(errorMessage: 'Something with wrong'));
      }
    }
  }
}
