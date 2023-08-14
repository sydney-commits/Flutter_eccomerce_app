part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? name;
  final String? email;
  final String? city;
  final String? location;
  final String? contact;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryfee;
  final String? total;
  final Checkout checkout;

  final String? userId;
  CheckoutLoaded(
      {this.name,
      this.email,
      this.city,
      this.location,
      this.contact,
      this.products,
      this.subtotal,
      this.deliveryfee,
      this.userId,
      this.total})
      : checkout = Checkout(
            name: name,
            email: email,
            city: city,
            location: location,
            contact: contact,
            products: products!,
            deliveryfee: deliveryfee,
            total: total,
            subtotal: subtotal,
            userId: userId
            );

  @override
  List<Object?> get props => [
        name,
        email,
        city,
        location,
        contact,
        deliveryfee,
        subtotal,
        total,
        products,
        userId
      ];
}
