import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/features/Auth/cubit/auth_states.dart';
import 'package:luxora_app/features/Auth/data/auth_repo.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitial());

  final AuthRepo authRepo = AuthRepo();

  //login
  Future login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await authRepo.login(email, password);
      emit(LoginSuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(LoginFailure(errorMessage));
    }
  }

  //Sign up
  Future signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    try {
      await authRepo.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(SignupSuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(SignupFailure(errorMessage));
    }
  }

  //Verify Email
  Future verifyEmail({required String email, required String otp}) async {
    emit(VerifyLoading());
    try {
      await authRepo.verifyEmail(email: email, otp: otp);
      emit(VerifySuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(VerifyFailure(errorMessage));
    }
  }
}
