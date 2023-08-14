import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/authentication/scaffold/theme.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/screens/account/payment/lipa_cash.dart';
import 'package:myapp1/screens/account/payment/lm.dart';
import 'package:myapp1/screens/checkout/payment_screen.dart';
import 'package:myapp1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

class PaymentInitilisation extends StatefulWidget {
  static const String routeName = '/paymentinit';
  final clientName;
  final location;
  final contact1;
  final products;

  const PaymentInitilisation(
      {Key? key, this.clientName, this.products, this.location, this.contact1})
      : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => PaymentInitilisation());
  }

  @override
  State<PaymentInitilisation> createState() => _PaymentInitilisationState();
}

class _PaymentInitilisationState extends State<PaymentInitilisation> {
  @override
  final _formKey1 = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final contactController = TextEditingController(text: '254');
    final lm = Provider.of<Lm>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [

Container(
  color: Colors.white,
  child: Text('sd', style:TextStyle(color: Colors.white))),
              SizedBox(height: 20,),
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

              // Text(widget.products.toString()),

              OrderSummary(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Enter Your Mpesa Number ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Text(' Format - 254707070707 ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Form(
                    key: _formKey1,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Number';
                        }
                        return null;
                      },
                      controller: contactController,
                      obscureText: false,
                      //  initialValue: "254",

                      keyboardType: TextInputType.phone,

                      decoration: ThemeHelper().textInputDecoration(
                          'Mpesa Number', 'Enter your Mpesa Number'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black
                    ),
                    onPressed: () {
                      if (_formKey1.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                      contact: contactController.text,
                                      contact1: widget.contact1,
                                      clientName: widget.clientName,
                                      location: widget.location,
                                      products: widget.products,
                                    )));

                       widget.products.forEach((item) => print(item));

                     
                      }
                    },
                    child: Text(
                      'Confirm Payment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text("Something wrong");
        }
      })),
    );
  }
}
