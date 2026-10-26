import 'package:dio/dio.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/core/network/api_exception.dart';
import 'package:luxora_app/core/network/api_service.dart';
import 'package:luxora_app/features/Home/data/category_model.dart';
import 'package:luxora_app/features/Home/data/offers_model.dart';
import 'package:luxora_app/features/Home/data/product_model.dart';

class HomeRepo {
  ApiService apiService = ApiService();

  //get products
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.get("/api/products");
      final data = response["items"];
      List<ProductModel> products = [];
      for (var element in data) {
        products.add(ProductModel.fromjson(element));
      }
      return products;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //get offers
  Future<List<OffersModel>> getoffers() async {
    try {
      final response = await apiService.get("/api/offers");
      final data = response["offers"]["items"];
      List<OffersModel> offers = [];
      for (var element in data) {
        offers.add(OffersModel.fromjson(element));
      }
      return offers;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //get category
  Future<List<CategoryModel>> getcategories() async {
    try {
      final response = await apiService.get("/api/categories");
      final data = response["categories"];
      List<CategoryModel> categories = [];
      for (var element in data) {
        categories.add(CategoryModel.fromjson(element));
      }
      return categories;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
