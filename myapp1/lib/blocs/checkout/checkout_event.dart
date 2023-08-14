part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? name;
  final String? userId;
  final String? email;
  final String? city;
  final String? location;
  final String? contact;
  final Cart? cart;

  UpdateCheckout(
      {this.name,
      this.email,
      this.city,
      this.location,
      this.cart,
      this.userId,
      this.contact});

  @override
  List<Object?> get props => [name, email, city, userId,location, cart, contact];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
