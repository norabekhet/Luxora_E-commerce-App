abstract class CategoryStates {}

class CategoryInitial extends CategoryStates {}

class CategoryLoading extends CategoryStates {}

class CategorySuccess extends CategoryStates {}

class CategoryFailure extends CategoryStates {
  final String message;
  CategoryFailure(this.message);
}
