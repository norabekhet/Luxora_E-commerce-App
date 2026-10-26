import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/features/Home/cubit/product_cubit/product_states.dart';
import 'package:luxora_app/features/Home/data/home_repo.dart';
import 'package:luxora_app/features/Home/data/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitial());

  HomeRepo homeRepo = HomeRepo();
  List<ProductModel> products = [];

  //get products
  Future getProducts() async {
    emit(ProductLoading());
    try {
      products = await homeRepo.getProducts();
      emit(ProductSuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(ProductFailure(errorMessage));
    }
  }
}
