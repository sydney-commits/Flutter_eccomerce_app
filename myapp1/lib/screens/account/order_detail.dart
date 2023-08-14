import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderItemDetail extends StatelessWidget {
  final orderItemId;

  const OrderItemDetail({Key? key, this.orderItemId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Order Information'),
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

                Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 12),
                      child: Text(output["orderItemId"]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Client Name"),
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(
                              'Client Id',
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(output["clientName"]),
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(output["contact"]))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14),
                      child: ListTile(
                        trailing: Text(output["location"]),
                        leading: Text('Service Type'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, left: 14.0, right: 14),
                      child: ListTile(
                        trailing: Text(output["contact1"]),
                        leading: Text(output["location"]),
                      ),
                    ),

                    Column(
                      children: [
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          title: Text(output['isProcessed'].toString()),
                          leading: Text('Processed'),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          title: Text(output['isApproved'].toString()),
                          leading: Text('Approved'),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          title: Text(output['isAssigned'].toString()),
                          leading: Text('Assigned'),
                        ),
                        ListTile(
                          title: Text(output['isOntransit'].toString()),
                          leading: Text('On Transit'),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 2, vertical: -4),
                          title: Text(output['isDelivered'].toString()),
                          leading: Text('Delivered'),
                        ),
                      ],
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Text(widget.products),
                    // ),
                    SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              delete1(String docId) async {
                                try {
                                  FirebaseFirestore.instance
                                      .collection("service_order")
                                      .doc(docId)
                                      .update({
                                    "isAccepted": true,
                                  });
                                } catch (e) {}
                              }

                              //  delete1(widget.serviceNumber);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 5),
                                      content:
                                          Text('Service Request Accepted')));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                minimumSize: const Size(150, 40)),
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              delete(String docId) async {
                                try {
                                  FirebaseFirestore.instance
                                      .collection("service_order")
                                      .doc(docId)
                                      .update({
                                    "isApproved": true,
                                  });
                                } catch (e) {}
                              }

                              //  delete(widget.serviceNumber);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 5),
                                      content:
                                          Text('Service Request Cancelled ')));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: const Size(150, 40)),
                            child: Text(
                              'Decline',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            delete2(String docId) async {
                              try {
                                FirebaseFirestore.instance
                                    .collection("orderItem")
                                    .doc(docId)
                                    .update({
                                  "isApproved": true,
                                });
                              } catch (e) {}

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 5),
                                      content:
                                          Text('Service Request Authorised')));
                            }

                            delete2(orderItemId);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              minimumSize: const Size(150, 40)),
                          child: Text(
                            'Authorise',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
