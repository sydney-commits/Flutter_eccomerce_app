import 'package:equatable/equatable.dart';
import 'package:myapp1/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({
    this.products = const <Product>[],
  });

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal <= 500.0) {
      return 100.0;
    }

    if (subtotal <= 1000) {
      return 200.0;
    }

    if (subtotal <= 2000) {
      return 300.0;
    }

    if (subtotal >= 2000) {
      return 400.0;
    } else
      return 10.0;
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 330) {
      return ('You can Add More Products');
    } else {
      double missing = 330.0 - subtotal;
      return 'Add \Ksh${missing.toStringAsFixed(2)} for free delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  double get totaldouble => total(subtotal, deliveryFee).toDouble();

  @override
  List<Object?> get props => [products];
}
