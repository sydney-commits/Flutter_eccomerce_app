import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/blocs/product/product_bloc.dart';
import 'package:myapp1/blocs/wishlist/wishlist_bloc.dart';
import 'package:myapp1/models/product_model.dart';

import 'package:myapp1/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        builder: (_) => ProductScreen(
              product: product,
            ),
        settings: RouteSettings(name: routeName));
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,


        
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                // enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: false,
              ),
              items: [
                HeroCarouselCard(product: product),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\Ksh. ${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Product Description',
                  style: Theme.of(context).textTheme.headline4,
                ),
                children: [
                  ListTile(
                    title: Text(
                      product.description,
                        
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
                title: Text(
                  'Service Type',
                  style: Theme.of(context).textTheme.headline4,
                ),
                children: [
                  ListTile(
                    //title: Text('sd',
                   title: Text('Merchant id : ${product.merchantCode}',
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ]),
          ),
          const SizedBox(height: 25),
          SectionTitle(title: 'Recommended Products'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList());
            } else {
              return Text('Something went wrong');
            }
          }),

                    const SizedBox(height: 15),
          SectionTitle(title: 'Popular Products'),
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


        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
     
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {
                
                    context
                        .read<WishlistBloc>()
                        .add(AddProductToWishlist(product));

                    final snackBar =
                        SnackBar(content: Text('Product Added To Wishlist'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              }),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                      Navigator.pushNamed(context, '/cart');

                      final snackBar =
                          SnackBar(content: Text('Product Added To Cart'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context).textTheme.headline3!,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
