import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/models/service_checkout_model.dart';
import 'package:myapp1/screens/account/service_report_item.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;


class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
      final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ServiceCheckout1>>(
          stream: readServices(),
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

  Widget buildUser(ServiceCheckout1 service) => 


  
  Column(
        children: [
          if(service.userId == _firebaseAuth.currentUser!.uid.toString())
          ListTile(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceReportItem(
                      
                        serviceNumber: service.serviceNumber,
                    
                      ),
                    ),
                  ),
              title: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Center(
                  child: Text('Service :${service.serviceType}',
                             style: TextStyle(
                                color: AppColors.Blue3,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),),
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: AppColors.Blue3),
              subtitle: Column(children: <Widget>[

                                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Order No : ",
                        style: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.bold,),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        service.serviceNumber,
                        style: TextStyle(color: Colors.black,
                              fontSize: 14,
                           ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                  
               
                   // Text(''),

                                 if (service.isDelivered == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            color: AppColors.Blue3,
                            child: Text(
                              'Order Delivered',
                              
                              style: TextStyle(color: Colors.white,
                              fontSize: 15
                              ),
                            ),
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
                              fontSize: 15
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

 
                  ],
                ),
                Divider( thickness: 1,
                    height: 1,
                    color: Colors.grey,)

              
              ])),
  
        ],
      );

  Stream<List<ServiceCheckout1>> readServices() {
      final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  _firebaseAuth.currentUser!.uid.toString();
    return FirebaseFirestore.instance
        .collection("service_order")
        
        // .where('userId',
        //     isEqualTo: _firebaseAuth.currentUser!.uid.toString())

        // .where('userId' ,isEqualTo:1)
        .orderBy('createdAt', descending: true)

        .limit(12)
       // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ServiceCheckout1.fromJson(doc.data()))
            .toList());
  }
}
