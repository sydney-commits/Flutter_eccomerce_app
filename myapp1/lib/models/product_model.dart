// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';

// class Product extends Equatable {
//   final String name;
//   final String category;
//   final String imageUrl;
//   final double price;
//   final bool isRecommended;
//   final bool isPopular;

//   const Product(
//       {required this.name,
//       required this.category,
//       required this.imageUrl,
//       required this.price,
//       required this.isRecommended,
//       required this.isPopular});

//   @override
//   // TODO: implement props
//   List<Object?> get props =>
//       [name, category, imageUrl, price, isRecommended, isPopular];

//   static Product fromSnapshot(DocumentSnapshot snap) {
//     Product product =
//         Product(
//           name: snap['name'],
//           imageUrl: snap['imageUrl'],
//            category: snap['category'],
//           price: snap['price'],
//            isRecommended: snap['isRecommended'],
//           isPopular: snap['isPopular'],

//           );

//     return product;
//   }

//   static List<Product> products = [
//     Product(
//         name: 'Headphones',
//         category: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//         isPopular: true),

//             Product(
//         name: 'Laptop',
//         category: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cm9uaWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//         isPopular: true),

//                     Product(
//         name: 'Motherboard',
//         category: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1563770660941-20978e870e26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGVsZWN0cm9uaWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//         isPopular: true),
//     Product(
//         name: 'Juice',
//         category: 'Soft Drinks',
//         imageUrl:
//             'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 35.83,
//         isRecommended: true,
//         isPopular: true),
//     Product(
//         name: 'Water',
//         category: 'Water Service',
//         imageUrl:
//             'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 90.00,
//         isRecommended: true,
//         isPopular: false),
//     Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         category: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//   ];
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String merchantCode;
  final String imageUrl;
  final double price;
  final double quantity;
  final bool isRecommended;
  final bool isPopular;

  final bool isAvailable;

  final String description;

  final String productId;

  const Product({
    required this.name,
    required this.merchantCode,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.isAvailable,
    required this.description,
    required this.quantity,
    required this.productId,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, merchantCode, imageUrl, price, isRecommended, isPopular];

  Map<String, dynamic> toJson() => {
    'name' :name ,'merchantCode':merchantCode,'imageUrl':imageUrl,
    'price':price, 'isRecommended':isRecommended,'isPopular':isPopular,
    'isAvailable':isAvailable,'description':description,
    'quantity':quantity,'productId':productId

  };

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      merchantCode: snap['merchantCode'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      isAvailable: snap['isAvailable'],
      description: snap['description'],
      quantity: snap['quantity'],
      productId: snap['productId'],
    );

    return product;
  }

//   static List<Product> products = [
//     Product(
//         name: 'Headphones',
//         merchantCode: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//         isPopular: true,

//         isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas'

//         ),

//             Product(
//         name: 'Laptop',
//         merchantCode: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1601524909162-ae8725290836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cm9uaWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//           isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',

//         isPopular: true),

//                     Product(
//         name: 'Motherboard',
//         merchantCode: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1563770660941-20978e870e26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGVsZWN0cm9uaWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 80.00,
//         isRecommended: false,
//              isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',
//         isPopular: true),
//     Product(
//         name: 'Juice',
//         merchantCode: 'Soft Drinks',
//         imageUrl:
//             'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 35.83,
//         isRecommended: true,
//              isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',
//         isPopular: true),
//     Product(
//         name: 'Water',
//         merchantCode: 'Water Service',
//         imageUrl:
//             'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//         price: 90.00,
//         isRecommended: true,
//              isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',
//         isPopular: false),
//     Product(
//         name: 'Wine1',
//         merchantCode: 'Food',
//              isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),
//             Product(
//         name: 'Wine1',
//         merchantCode: 'Food',

//              isAvailable: false,
//         description: 'dddd',
//         quantity: 22.23,
//         productId: 'sas',
//         imageUrl:
//             'https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         price: 100.00,
//         isRecommended: true,
//         isPopular: false),

//   ];
// }

}
