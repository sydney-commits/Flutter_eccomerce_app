import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/checkout/checkout_bloc.dart';
import 'package:myapp1/screens/checkout/payment_init.dart';
import 'package:myapp1/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  final _formKey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Checkout'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                    if (state is CheckoutLoading) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          // Navigator.pushNamed(context, '/paymentinit');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentInitilisation()));

                          final snackBar = SnackBar(
                              content: Text('Finish Order and Make Payment'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text(
                          "Proceed",
                          style: Theme.of(context).textTheme.headline3!,
                        ),
                      );
                    }

                    if (state is CheckoutLoaded) {
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            context
                                .read<CheckoutBloc>()
                                .add(ConfirmCheckout(checkout: state.checkout));
                            // Navigator.pushNamed(context, '/paymentinit');

                            if (_formKey.currentState!.validate())
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentInitilisation(
                                            clientName: state.name,
                                            products: state.products,
                                            location: state.location,
                                            contact1: 'null',
                                            // contact1: state.contact
                                          )));

                            final snackBar = SnackBar(
                              duration: Duration(milliseconds: 500),
                                content: Text('Finish Order and Make Payment'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: Text(
                            "Order Now",
                            style: Theme.of(context).textTheme.headline3!,
                          ),
                        ),
                      );
                    } else {
                      return Text('sth is wk');
                    }
                  }),
                  Text('s')
                ]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CheckoutLoaded) {
              return ListView(
                children: [
                  Center(
                    child: Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextFormField((
                          value,
                        ) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckout(name: value));
                        }, context, 'Name', TextInputType.text),

                        _buildTextFormField((value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckout(contact: value));
                        }, context, 'Contact', TextInputType.number),

                        // _buildTextFormField((value) {
                        //   context
                        //       .read<CheckoutBloc>()
                        //       .add(UpdateCheckout(email: value));
                        // }, context, 'Email'),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'DELIVERY INFORMATION',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Divider(height: 3),
                        _buildTextFormField((value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckout(city: value));
                        }, context, 'Pickup Station', TextInputType.text),
                        _buildTextFormField((value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckout(location: value));
                        }, context, 'Town', TextInputType.text),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return Text('Something is wrong');
            }
          }),
        ));
  }

  Padding _buildTextFormField(Function(String)? onChanged, BuildContext context,
      String labelText, keytype) {
    return Padding(
        padding: const EdgeInsets.only(top: 18, right: 10, bottom: 16),
        child: Row(children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Compulsary Field';
                  }
                  return null;
                },
                keyboardType: keytype,
                autovalidateMode: AutovalidateMode.always,
                // autovalidate: true,
                onChanged: onChanged,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)))),
          )
        ]));
  }
}
