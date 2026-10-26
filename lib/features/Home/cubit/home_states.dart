abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class ProductLoading extends HomeStates {}

class ProductSuccess extends HomeStates {}

class ProductFailure extends HomeStates {
  final String message;
  ProductFailure(this.message);
}

class OffersLoading extends HomeStates {}

class OffersSuccess extends HomeStates {}

class OffersFailure extends HomeStates {
  final String message;
  OffersFailure(this.message);
}

class CategoryLoading extends HomeStates {}

class CategorySuccess extends HomeStates {}

class CategoryFailure extends HomeStates {
  final String message;
  CategoryFailure(this.message);
}
