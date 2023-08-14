import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoaded) {
        return Column(
          children: [
            Column(
              children: [
                Divider(
                  thickness: 3,
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SubTotal',
                          style: Theme.of(context).textTheme.headline5),
                      Text('\Ksh ${state.cart.subtotalString}',
                          style: Theme.of(context).textTheme.headline5)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          style: Theme.of(context).textTheme.headline5),
                      Text('\Ksh ${state.cart.deliveryFeeString} ',
                          style: Theme.of(context).textTheme.headline5)
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Total',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('\Ksh ${state.cart.totalString}',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold), )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        );
      } else {
        return Text("Something is wrong");
      }
    });
  }
}
