import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/models/models.dart';

import 'package:paginate_firestore/paginate_firestore.dart';

class ServiceProducts extends StatefulWidget {
  @override
  _ServiceProductsState createState() => _ServiceProductsState();
}

class _ServiceProductsState extends State<ServiceProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginateFirestore(
        physics: NeverScrollableScrollPhysics(),
        itemsPerPage: 4,

    

        footer: const SliverToBoxAdapter(
            child: Center(child: Text('...'))),

        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return
           
              Card(
            margin: const EdgeInsets.only( bottom: 15),
            child: ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: data == null
                      ? const Text('Error in data')
                      : Image.network(
                          data['imageUrl'],
                          fit: BoxFit.cover,
                        )),
              title: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: data == null
                    ? const Text('Error in data')
                    : Center(
                        child: Text(
                          '${data['name'].toString()}',
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              trailing: Icon(Icons.add_shopping_cart,color: AppColors.Blue3),
              subtitle: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: data == null
                          ? const Text('Error in data')
                          : Text(
                              ' Ksh. ${data["price"].toString()}',
                              style: TextStyle(
                                color: AppColors.Blue3,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
 
                ],
              ),
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.pushNamed(context, '/product',
                      arguments: Product(
                        name: data!["name"],
                        merchantCode: data["merchantCode"],
                        imageUrl: data["imageUrl"],
                        price: data["price"],
                        isRecommended: data["isRecommended"],
                        isPopular: data["isPopular"],
                        isAvailable: data["isAvailable"],
                        description: data["description"],
                        quantity: data["quantity"],
                        productId: data["productId"],
                      ));
                });
              },
            ),
          );
          //       ]),
          // );
        },

        query: FirebaseFirestore.instance
            .collection('productNew')
            .orderBy('createdAt', descending: true)
            .limit(14),
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}
