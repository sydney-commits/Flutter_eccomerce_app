import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/models/cart_model.dart';
import 'package:myapp1/models/models.dart';
import 'package:myapp1/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CartScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Cart",
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');

                    final snackBar = SnackBar(content: Text('Go To Checkout '));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  
                  child:
                  
                  Text(
                    "Checkout",
                    style: Theme.of(context).textTheme.headline3!,
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CartLoaded) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.cart.freeDeliveryString,
                                  style: Theme.of(context).textTheme.headline5),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Add More',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                  product: state.cart
                                      .productQuantity(state.cart.products)
                                      .keys
                                      .elementAt(index),
                                  quantity: state.cart
                                      .productQuantity(state.cart.products)
                                      .values
                                      .elementAt(index),
                                );
                              },
                            ),
                          ),
                          OrderSummary(),
                        ],
                      )
                    ]));

            // ignore: prefer_const_constructors

          } else {
            return Text("Something is wrong");
          }
        }));
  }
}
