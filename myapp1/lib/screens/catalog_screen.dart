import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/category/category_bloc.dart';

import 'package:myapp1/blocs/product/product_bloc.dart';
import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/models/models.dart';

import 'package:myapp1/screens/checkout/service_checkout.dart';
import 'package:myapp1/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(category: category),
        settings: RouteSettings(name: routeName));
  }

  final Category category;

  const CatalogScreen({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        appBar: CustomAppBar(
          title: category.businessCode,
        ),
        bottomNavigationBar: BottomAppBar(
            color: AppColors.Dark,
            child: Container(
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: _whatsapp,
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "Talk To Us",
                        style: Theme.of(context).textTheme.headline3!,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: _phonecall,
                        child: FaIcon(FontAwesomeIcons.phone,
                            color: Colors.green)),
                  ]),
            )),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      category == null ? category.imageUrl : category.imageUrl,
                      fit: BoxFit.cover,
                      // width: 1000,
                      width: 600.0,
                      height: 180,
                    ),
                    Positioned(
                      bottom: 8.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(100, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Center(
                          child: Text(
                            category.description,
                      //    category == null ? category.fname : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                 
       
               Positioned(
                      top: 4.0,
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
                        child: Center(
                          child: Text(
                            category.businessname,
                      //    category == null ? category.fname : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                 
                  ],
                )),
          ),



          SizedBox(
            height: 10,
          ),

          ///
          (category.servicetype == "Service")
              ?ServiceCheckout(category.businessname)

              : 
              BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                  //  return ProductCarousel(
                  //     products: state.products
                  //         .where((product) => product.isRecommended)
                  //         .toList());

                  if (state is ProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                    //  return ProductCarousel(
                    // products: Product.products
                    //     .where((product) => product.isRecommended)
                    //     .toList());
                  }

                  if (state is ProductLoaded) {
                    return ProductCarousel1(
                        products: state.products
                            .where((product) =>
                                product.merchantCode == category.businessCode)
                            .toList());
                  } else {
                    return Text('Something went wrong');
                  }
                }),

          const SizedBox(
            height: 15,
          ),

           Padding(
             padding: const EdgeInsets.only(left:38.0, right: 38),
             child: Divider(height: 1,),
           ),

               const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
     
                Text('Business Code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18.0,bottom: 18),
            child: _descCard(
                 category.businessCode, category.location),
          ),

          SizedBox(
            width: 50,
            child: Divider(height: 1)),

          SizedBox(height: 15),

          
               Container(
                  child: Center(child: Text('Related Services',
                     style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )))),

            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true,
                    initialPage: 2,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return Text('ss43');
              }
            }),



        ]));
  }

  Column _descCard( String text2, String text3) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
 
              Center(
                child: Text(text2,
                    style: TextStyle(
                      color: AppColors.Blue3,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text(text3,
                  style: TextStyle(
                    color: AppColors.Blue3,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        )
      ],
    );
  }

  _whatsapp() async {
    String phone = category.contact;
    String message = "Hello";
    String url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _phonecall() async {
    String url = 'tel:${category.contact}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
