import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthfactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard(
      {Key? key,
      this.leftPosition = 5,
      required this.product,
      this.widthfactor = 2.5,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthfactor;
    return InkWell(
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 600), () {
          Navigator.pushNamed(context, '/product', arguments: product);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
           
            Container(
              width: widthValue +18,
              height: 180,
              //  color: Colors.green,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 60,
                left: 5,
                child: Container(
                  width: widthValue - 2 - leftPosition,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                )),
            Positioned(
              top: 70,
              left: leftPosition + 5,
              child: Container(
                width: widthValue - 12 - leftPosition,
                height: 60,
                decoration: BoxDecoration(color: AppColors.VEGS),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        //flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                                          child: Text(
                                product.name,
                                // product.merchant,
                                // product.
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Text(
                              '\Ksh. ${product.price}',

                            
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
               
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
