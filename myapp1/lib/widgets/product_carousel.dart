import 'package:flutter/material.dart';
import 'package:myapp1/models/models.dart';
import 'package:myapp1/widgets/widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 165,
        child: ListView.builder(
        
            shrinkWrap: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(
                  product: products[index],
                ),
              );
            }));
  }
}

class ProductCarousel1 extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel1({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.25),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: products[index],
          );
        });
  }
}
