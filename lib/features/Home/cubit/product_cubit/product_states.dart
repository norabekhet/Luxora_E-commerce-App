abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class ProductLoading extends ProductStates {}

class ProductSuccess extends ProductStates {}

class ProductFailure extends ProductStates {
  final String message;
  ProductFailure(this.message);
}
