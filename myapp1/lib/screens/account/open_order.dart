import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/helpers/appColors.dart';


import 'package:myapp1/models/order_item_model.dart';
import 'package:myapp1/screens/account/order_item1.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:page_transition/page_transition.dart';


class OrdersReportAll extends StatefulWidget {
  @override
  _OrdersReportAllState createState() => _OrdersReportAllState();
}

class _OrdersReportAllState extends State<OrdersReportAll> {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<OrderItem>>(
          stream: readOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Sumething went Wrong ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildUser(OrderItem orderItem) {
    return SingleChildScrollView(
      child: Column(children: [
        if(orderItem.clientUid ==  _firebaseAuth.currentUser!.uid.toString())
        Card(
          child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Order No ',
                    style: new TextStyle(
                    fontSize: 14.0,),
              ),),
              title: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  ' ${orderItem.orderItemId}',
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
              subtitle: Column(
                children: [
            
                  if (orderItem.isProcessed == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Order Processed',
                            style: TextStyle(color: Colors.black,fontSize: 14),
                          )
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            ' Processing In progress',
                            style: TextStyle(color: Colors.black, fontSize: 14
                          )
                          ),
                        ],
                      ),
                    ),
                  if (orderItem.isDelivered == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            color: AppColors.Blue3,
                            child: Text(
                              'Order Delivered',
                              style: TextStyle(color: Colors.white, fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          )
                          )
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.lightGreen,
                            child: Text(
                              'Order Pending Delivery',
                              style: TextStyle(color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              onTap: ()  {
                 

                    Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: OrderItemDetail(orderItemId: orderItem.orderItemId,)));

   
              
              }),
        ),
      ]),
    );
  }
}

Stream<List<OrderItem>> readOrders() {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  _firebaseAuth.currentUser!.uid.toString();
  return FirebaseFirestore.instance
      .collection("orderItem")
     


       

     // .where('clientUid', isEqualTo: _firebaseAuth.currentUser!.uid.toString())
      .orderBy('createdAt', descending: true)
      // .where('userId' ,isEqualTo:1)
      // .where('isApproved' ,isEqualTo: true)
      // .orderBy('userId', descending: true)
      //  .orderBy('createdAt', descending: true)
      .limit(12)
    
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => OrderItem.fromJson(doc.data())).toList());
}
