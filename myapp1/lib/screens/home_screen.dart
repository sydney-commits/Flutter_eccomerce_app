import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/blocs/category/category_bloc.dart';
import 'package:myapp1/blocs/product/product_bloc.dart';
import 'package:myapp1/screens/service_products.dart';
import 'package:myapp1/widgets/widgets.dart';
import 'package:provider/provider.dart';

//Auth

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

///////===============User Available ==============

    return Scaffold(
      
     
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              height: 45,
              color: Colors.black,
              child: Center(
                child: Text('Sydtech Deliveries',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white)),
              ))
          ),
      bottomNavigationBar: CustomNavBar(),
      
      body:
          SingleChildScrollView(
        child: Column(
          children: [
            // if (authService.currentUser1() == null)
            //   Container(
            //       child: Padding(
            //     padding: const EdgeInsets.only(left: 18.0),
            //     child: Text('User Not Logged In'),
            //   ))
            // else
            //   Container(
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 18.0),
            //       child: Text('User  Logged In',
            //          style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 10,
            //                   fontWeight: FontWeight.bold,
            //                 )),
            //     ),
            //   ),

               Container(
                  child: Center(child: Text('Services',
                     style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
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
                    initialPage: 1,
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

            SectionTitle(title: 'Top Products'),

            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel1(
                    products: state.products
                    .take(20)
                        //  .where((product) => product.isPopular)
                        .toList());
              } else {
                return Text('Something went wrong');
              }
            }),


               SectionTitle(title: 'Latest Products'),

             SizedBox(height:1050,child: ServiceProducts()),


            SectionTitle(title: 'Recommended'),

            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                  //   (),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList());
              } else {
                // ignore: prefer_const_constructors
                return Text('Something went wrong');
              }
            }),

         

            // SizedBox(height: 450, child: ProductListing()),

            SizedBox(
              height: 20,
            ),

            SizedBox(
                child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Divider(
                height: 1,
              ),
            )),
            SizedBox(
              height: 8,
            ),


                    SizedBox(
              height: 8,
            ),


            SectionTitle(title: 'Most Popular'),

            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());
              } else {
                return Text('Something went wrong');
              }
            }),

            const _myWidget(),
            SizedBox(
              height: 10,
            ),

  

            SectionTitle(title: 'Ads section'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        "https://media.istockphoto.com/photos/digital-marketing-concept-online-advertisement-picture-id1284549946?k=20&m=1284549946&s=612x612&w=0&h=VVGNI_vARpvpqo2Md_xsfcSiotjVVjzisV75dF15T-0=",
                        fit: BoxFit.cover,
                        width: 400.0,
                        height: 240,
                      ),
                      Positioned(
                        bottom: 5.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: const Text(
                            'Crazy Offers starting May 2020',
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



          ],
        ),
      ),
    );
  }
}

class _myWidget extends StatelessWidget {
  const _myWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 40.0,
          width: 90,
          color: Colors.transparent,
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )),
              child: new Center(
                child: new Text(
                  "Services",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              )),
        ),
        Container(
          height: 40.0,
          width: 90,
          color: Colors.transparent,
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )),
              child: new Center(
                child: new Text(
                  "Products",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              )),
        ),
        Container(
          height: 40.0,
          width: 90,
          color: Colors.transparent,
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )),
              child: new Center(
                child: new Text(
                  "Offers",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
