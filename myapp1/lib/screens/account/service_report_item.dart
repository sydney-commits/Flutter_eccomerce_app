// import 'package:flutter/material.dart';

// class ServiceReportItem extends StatefulWidget {
//   final clientName;
//   final userId;
//   final serviceNumber;
//   final contact;
//   final location;
//   final remark;
//   final serviceType;

//   const ServiceReportItem(
//       {Key? key,
//       this.clientName,
//       this.userId,
//       this.serviceNumber,
//       this.contact,
//       this.location,
//       this.remark,
//       this.serviceType})
//       : super(key: key);

//   @override
//   _ServiceReportItemState createState() => _ServiceReportItemState();
// }

// class _ServiceReportItemState extends State<ServiceReportItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Desc'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: Column(
//             children: [
//               ListTile(
//                 title: Column(
                  
//                   children: [
//                               Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(14.0),
//                           child: Text("Service Type "),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(14.0),
//                           child: Text(widget.serviceType),
//                         ),
//                       ],
//                     ),
//                     Divider(color: Colors.blue,height: 1,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(14.0),
//                           child: Text("Client Name "),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(14.0),
//                           child: Text(widget.clientName),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 subtitle: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.edit,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.delete,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//           Expanded(child: Container())
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:myapp1/helpers/appColors.dart';


class ServiceReportItem extends StatefulWidget {
  final serviceNumber;

  ServiceReportItem({
    Key? key,
    this.serviceNumber,
  }) : super(key: key);

  @override
  State<ServiceReportItem> createState() => _ServiceReportItemState();
}

class _ServiceReportItemState extends State<ServiceReportItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Client Service Info'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("service_order")
            .doc(widget.serviceNumber)
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            var value = output!["clientName"]; // <-- Your value
            return Column(
              children: [
                Column(
                  children: [
   
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 12),
                      child: Text(
                        output["serviceNumber"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              output["name"],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Service Requested ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(
                              output["serviceType"],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Contact ",
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
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(
                              output["location"],
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

                                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Order Date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: 
                              Text(

                              '${DateFormat('dd MMM yyyy kk:mm').format(output['createdAt'].toDate())}',
                      
                                style: TextStyle(
                                  color: AppColors.Blue3,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                            ))
                      ],
                    ),

                             SizedBox(
                      height: 25,
                    ),  

                    
                                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Delivered Date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        if (output['deliveredAt'] != null) 
                          
                      
                        
                        Container(
                            padding: EdgeInsets.only(right: 12),
                            child: 
                          
                              Text(

                              '${DateFormat('dd MMM yyyy kk:mm').format(output['deliveredAt'].toDate())}',
                      
                                style: TextStyle(
                                  color: AppColors.Blue3,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                            )),

                            
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
                                'IsAccepted',
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
                            Text(output['isAccepted'].toString()),
                            Text(output['isDelivered'].toString())
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
  

                        Divider(height: 0.8,),

                                  SizedBox(
                          height: 12,
                        ),

                

                                              Row(
                            // mainAxisAlignment: MainAxisAlignment.min,

                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    output['remark'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                                  Padding(
                          padding: const EdgeInsets.only(left:38.0, right: 38, top: 18),
                          child: Divider(height: 0.8,color: Colors.black)
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 6),
     
                  
                   Center(
                      child: ElevatedButton(
                          onPressed: () {
                            delete2(String docId) async {
                              try {
                                FirebaseFirestore.instance
                                    .collection("service_order")
                                    .doc(docId)
                                    .update({
                                  "isDelivered": true,
                                  'deliveredAt':DateTime.now()
                                });
                              } catch (e) {}

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 5),
                                      content:
                                          Text('Service Delivered')));
                            }

                            delete2(widget.serviceNumber);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              minimumSize: const Size(150, 40)),
                          child: Text(
                            'Confirm Service Delivery',
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

