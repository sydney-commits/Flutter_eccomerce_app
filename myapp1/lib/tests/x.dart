import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  
  }

  @override
  Widget build(BuildContext context) {

  


final List<String> imgList = [

  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();



    return Scaffold(
      appBar: CustomAppBar(
        title: "Syd120",
      ),
      bottomNavigationBar: CustomNavBar(),

      body: Container(
        
        
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
         // enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: false,
        ),
        items: imageSliders,
      )),
    );
  }
}


///dummy 
// Container(
//   color: Colors.white,
//   child:
//    (category.isService.toString() == "false")
//   ? Text("Hello1")
//   : Text("Hello2")
// ),



///ddumm2 
///// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp1/blocs/category/category_bloc.dart';
// import 'package:myapp1/blocs/product/product_bloc.dart';
// import 'package:myapp1/models/models.dart';
// import 'package:myapp1/screens/checkout/service_checkout.dart';
// import 'package:myapp1/widgets/test1.dart';
// import 'package:myapp1/widgets/widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CatalogScreen extends StatelessWidget {
//   static const String routeName = '/catalog';

//   static Route route({required Category category}) {
//     return MaterialPageRoute(
//         builder: (_) => CatalogScreen(category: category),
//         settings: RouteSettings(name: routeName));
//   }

//   final Category category;

//   const CatalogScreen({
//     required this.category,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final List<Product> categoryProducts = Product.products
//         .where((product) => product.category == category.name)
//         .toList();

//     return Scaffold(
//         appBar: CustomAppBar(
//           title: category.name,
//         ),
//         bottomNavigationBar: BottomAppBar(
//             color: Colors.black,
//             child: Container(
//               height: 70,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(primary: Colors.white),
//                         onPressed: () {},
//                         child: FaIcon(FontAwesomeIcons.phone,
//                             color: Colors.green)),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(primary: Colors.white),
//                       onPressed: () {},
//                       child: Text(
//                         "Talk To Us",
//                         style: Theme.of(context).textTheme.headline3!,
//                       ),
//                     ),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(primary: Colors.white),
//                         onPressed: () {},
//                         child: FaIcon(
//                           FontAwesomeIcons.whatsapp,
//                           color: Colors.green,
//                         )),
//                   ]),
//             )),

//         // condition ? Text("True") : null,

//         body: ListView(children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(
//                       category == null ? category.imageUrl : category.imageUrl,
//                       fit: BoxFit.cover,
//                       width: 600.0,
//                       height: 180,
//                     ),

//                     // category.isService.toString() == "false" ?
//                     //  print('hello') : category.imageUrl,

//                     Positioned(
//                       bottom: 5.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 0, 0, 0),
//                               Color.fromARGB(0, 0, 0, 0)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 20.0),
//                         child: Text(
//                           category == null ? category.name : '',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//           _descCard(),

// //          Container(
// //   color: Colors.white,
// //   child:
// //    (category.isService.toString() == "false")
// //   ? Text("Hello1")
// //   : Text("Hello2")
// // ),

//           (category.isService.toString() == "false")
//               ? ServiceCheckout()
//               : BlocBuilder<ProductBloc, ProductState>(
//                   builder: (context, state) {
//                   //  return ProductCarousel(
//                   //     products: state.products
//                   //         .where((product) => product.isRecommended)
//                   //         .toList());
//                   if (state is ProductLoading) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );

//                     //  return ProductCarousel(
//                     // products: Product.products
//                     //     .where((product) => product.isRecommended)
//                     //     .toList());
//                   }

//                   if (state is ProductLoaded) {
//                     return CatalogCarouesel(
//                         products: state.products
//                             .where(
//                                 (product) => product.category == category.name)
//                             .toList());
//                   } else {
//                     return Text('Something went wrong');
//                   }
//                 }),
//         ])

//         // body: BlocBuilder<ProductBloc, ProductState>(
//         //   builder: (context, state) {
//         //     return GridView.builder(
//         //         padding:
//         //             const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//         //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         //             crossAxisCount: 2, childAspectRatio: 1.15),
//         //         itemCount: categoryProducts.length,
//         //         itemBuilder: (BuildContext context, int index) {
//         //           return Center(
//         //               child: ProductCard(
//         //             product: categoryProducts[index],
//         //             widthfactor: 2.2,
//         //           ));
//         //         }
//         //         );
//         //   },
//         // )
//         );
//   }
// }

// class _descCard extends StatelessWidget {
//   const _descCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//       child: ListTile(
//         title: Text(
//           'We Deal with Service Movements in the CBD , Check out',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 14.0,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         leading: Text(
//           'Desc : ',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 14.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Text('sdjhfdjdsfdsf'),
//       ),
//     );
//   }
// }

