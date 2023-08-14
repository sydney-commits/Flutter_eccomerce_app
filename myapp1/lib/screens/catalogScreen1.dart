// import 'package:flutter/material.dart';
// import 'package:myapp1/models/models.dart';
// import 'package:myapp1/widgets/widgets.dart';

// class CatalogScreen extends StatelessWidget {
// //  const CatalogScreen({Key? key}) : super(key: key);
//   static const String routeName = '/catalog';

//   static Route route({required Category category}) {
//     return MaterialPageRoute(
//         builder: (_) => CatalogScreen(category: category),
//         settings: RouteSettings(name: routeName));
//   }

//   final Category category;

 

//   const CatalogScreen({required this.category,});

//   @override
//   Widget build(BuildContext context) {

//     final List<Product> categoryProducts = Product.products
//         .where((product) => product.merchantCode == category.name)
//         .toList();


//     return Scaffold(
//         appBar: CustomAppBar(
//           title: category.name,
//         ),
//         bottomNavigationBar: CustomNavBar(),
        
//         body: GridView.builder(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, childAspectRatio: 1.15),
//             itemCount: categoryProducts.length,

//             //categoryProducts.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Center(
//                   child: ProductCard(
//                 product: categoryProducts[index],
//                 widthfactor: 2.2,
//               )
//               );
//             }
//             )
//             );
//   }
// }
