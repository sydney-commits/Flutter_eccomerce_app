// import 'package:flutter/material.dart';
// import 'package:myapp1/models/models.dart';
// import 'package:myapp1/widgets/widgets.dart';

// class CatalogCarouesel extends StatelessWidget {
//   final List<Product> products;
//   const CatalogCarouesel({
//     Key? key,
//     required this.products,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         shrinkWrap: true,
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, childAspectRatio: 1.15),
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 5.0),
//             child: ProductCard(
//               product: products[index],
//             ),
//           );
//         });
//     // return ListView.builder(

//     //     shrinkWrap: true,
//     //     padding:
//     //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//     //     scrollDirection: Axis.vertical,
//     //     itemCount: products.length,
//     //     itemBuilder: (context, index) {
//     //       return Padding(
//     //         padding: const EdgeInsets.only(right: 5.0),
//     //         child: ProductCard(
//     //           product: products[index],
//     //         ),
//     //       );
//     //     });
//   }
// }
