import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/features/Auth/cubit/auth_states.dart';
import 'package:luxora_app/features/Auth/data/auth_repo.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  final AuthRepo authRepo = AuthRepo();

  //login
  Future login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepo.login(email, password);
      emit(AuthSuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(AuthFailure(errorMessage));
    }
  }
}
