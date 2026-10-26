abstract class OffersStates {}

class OffersInitial extends OffersStates {}

class OffersLoading extends OffersStates {}

class OffersSuccess extends OffersStates {}

class OffersFailure extends OffersStates {
  final String message;
  OffersFailure(this.message);
}
