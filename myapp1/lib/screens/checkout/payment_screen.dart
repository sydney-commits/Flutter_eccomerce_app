import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/models/orderItem_model.dart';

import 'package:myapp1/screens/account/payment/lm.dart';
import 'package:myapp1/screens/home_screen.dart';

import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key,
      required this.contact,
      this.clientName,
      this.contact1,
      this.location,
      this.products})
      : super(key: key);

  static const String routeName = '/payment';

  final clientName;
  final String contact;
  final contact1;
  final location;
  final products;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => PaymentScreen(
              contact: '0200002332',
            ));
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future createCartItem(CartItem cartItem) async {
    final docUser = FirebaseFirestore.instance.collection('orderItem').doc();
    cartItem.orderItemId = docUser.id;

    final json = cartItem.toJson();

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    final lm = Provider.of<Lm>(context);

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Confrimation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 128.0),
                  child: Text('Your Order is Completed',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Thank You For Shopping With Us',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text('Make Your Payment',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListTile(
                  leading: Text('Amount To PAY',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black)),
                  trailing: Text(state.cart.totalString,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    final cartItem = CartItem(
                      clientName: widget.clientName,
                      location: widget.location,
                      //   contact1: widget.contact1,
                      contact1: 'null',
                      contact: widget.contact,
                      products: widget.products.toString(),

                      createdAt: DateTime.now(),
                      clientUid: authService.currentUser1().uid.toString(),
                      totalCost: state.cart.totaldouble,
                      isPaid: false,

                      //     orderItems: [widget.products.toList()],

                      orderItems:
                          widget.products.map((e) => e.toJson()).toList(),
                    );

                    lm.startCheckout(userPhone:widget.contact, amount:state.cart.totaldouble);

                    createCartItem(cartItem);
                  //  Navigator.pop(context);

                                    Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 1000),
                        child: HomeScreen()));

   

                    // Navigator.pushNamed(context, '/');
                  },
                  child: Text('Make Payment')),
              SizedBox(
                height: 10,
              )
            ],
          );
        } else {
          return Text("Something wrong");
        }
      })),
    );
  }
}

// Future createCartItem(CartItem cartItem) async {
//   final docUser = FirebaseFirestore.instance.collection('orderItem').doc();
//   cartItem.orderItemId = docUser.id;

//   final json = cartItem.toJson();

//   await docUser.set(json);
