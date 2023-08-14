import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/helpers/appColors.dart';

class OrderItemDetail extends StatelessWidget {
  final orderItemId;

  const OrderItemDetail({Key? key, this.orderItemId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Product Orders'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("orderItem")
            .doc(orderItemId)
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            var value = output!["clientName"]; // <-- Your value
            return
                //  Text('Value = $value');

                //  Text(output["location"]);

                ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 12),
                  child: Center(
                    child: Text(
                      'Order No : ${output["orderItemId"]}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Client Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          output["clientName"],
                          style: TextStyle(
                            color: AppColors.Blue3,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                    padding: EdgeInsets.only(bottom: 12, top: 12),
                    child: Center(
                      child: Text(
                        'Products Ordered',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,
                          color: AppColors.Blue3,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                // Text(output['orderItems'][1]['isAvailable'].toString()),

                // Text(output['orderItems'].toString()),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: output['orderItems'].length,
                  itemBuilder: (context, index) => Card(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, bottom: 8, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Product : ${output['orderItems'][index]['name'].toString()}',
                                style: TextStyle(
                        
                            fontSize: 14,
                            fontWeight: FontWeight.normal,)),
                            Text(
                                'Quantity : ${output['orderItems'][index]['quantity'].toString()}',
                                style: TextStyle(
                      
                            fontSize: 14,
                            fontWeight: FontWeight.normal,)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Price : Ksh ${output['orderItems'][index]['price'].toString()}',
                                 style: TextStyle(
                        
                            fontSize: 14,
                            fontWeight: FontWeight.normal,)),
                            Text(
                                'MerchantCode : ${output['orderItems'][index]['merchantCode'].toString()}',
                                 style: TextStyle(
                        
                            fontSize: 14,
                            fontWeight: FontWeight.normal,)),
                          ],
                        ),
                      )
                    ],
                  )

                      //  ListTile(
                      //   title: Text(output['orderItems'][index]
                      //           ['isAvailable']
                      //       .toString()),
                      // ),
                      ),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          output["contact"],
                          style: TextStyle(
                            color: AppColors.Blue3,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22),
                  child: Divider(
                    thickness: 2,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Center(
                              child: Text(
                            'Approved',
                            style: TextStyle(
                              color: AppColors.Blue3,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                        Expanded(
                          child: Center(
                              child: Text(
                            'OnTransit',
                            style: TextStyle(
                              color: AppColors.Blue3,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(output['isApproved'].toString()),
                        Text(output['isAssigned'].toString())
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Center(
                              child: Text(
                            'Processed',
                            style: TextStyle(
                              color: AppColors.Blue3,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                        Expanded(
                          child: Center(
                              child: Text(
                            'Delivered',
                            style: TextStyle(
                              color: AppColors.Blue3,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(output['isProcessed'].toString()),
                        Text(output['isDelivered'].toString())
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      height: 0.8,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),

                SizedBox(height: 6),

                ElevatedButton(
                    onPressed: () {
                      delete2(String docId) async {
                        try {
                          FirebaseFirestore.instance
                              .collection("orderItem")
                              .doc(docId)
                              .update({
                            "isDelivered": true,
                            "deliveredDate":DateTime.now()
                          });
                        } catch (e) {}

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text('Product Order Processed')));
                      }

                      delete2(orderItemId);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey, minimumSize: const Size(150, 40)),
                    child: Text(
                      'Confirm Delivery',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
