import 'package:equatable/equatable.dart';
import 'package:myapp1/models/models.dart';

class Checkout extends Equatable {
  final String? name;
  final String? email;
  final String? city;
  final String? location;
  final String? contact;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryfee;
  final String? total;
  final String? userId;

  const Checkout(
      {required this.name,
      required this.email,
      required this.city,
      required this.location,
      required this.contact,
      required this.deliveryfee,
      required this.subtotal,
      required this.total,
      required this.userId,
      required this.products});

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


//changimh model to map for easy updating
  Map<String, Object> toDocument() {
    Map customerAdress = Map();
    customerAdress['location'] = location;
    customerAdress['city'] = city;
    customerAdress['contact'] = contact;

    return {
      'customerAdress': customerAdress,
      'name': name!,
      'email': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryfee': deliveryfee!,
      'total': total!,
      "userId": userId!,
    };
  }
}
