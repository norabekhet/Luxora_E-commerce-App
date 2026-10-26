import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/features/Home/cubit/offers_cubit/offers_states.dart';
import 'package:luxora_app/features/Home/data/home_repo.dart';
import 'package:luxora_app/features/Home/data/offers_model.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersInitial());

  HomeRepo homeRepo = HomeRepo();
  List<OffersModel> offers = [];

  //get products
  Future getOffers() async {
    emit(OffersLoading());
    try {
      offers = await homeRepo.getoffers();
      emit(OffersSuccess());
    } catch (e) {
      String errorMessage = "Something went wrong";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      emit(OffersFailure(errorMessage));
    }
  }
}
