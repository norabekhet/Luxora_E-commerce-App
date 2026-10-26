import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/category_states.dart';
import 'package:luxora_app/features/Home/data/category_model.dart';
import 'package:luxora_app/features/Home/data/home_repo.dart';

class CateegoryCubit extends Cubit<CategoryStates> {
  CateegoryCubit() : super(CategoryInitial());

  HomeRepo homeRepo = HomeRepo();
  List<CategoryModel> category = [];

  //get categories
  Future getCategory() async {
    emit(CategoryLoading());
    try {
      category = await homeRepo.getcategories();
      emit(CategorySuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(CategoryFailure(errorMessage));
    }
  }
}
