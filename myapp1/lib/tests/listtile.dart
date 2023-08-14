// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project_one/helpers/appColors.dart';
// import 'package:project_one/pages/layout/user/details/detailsPage.dart';
// import 'package:project_one/pages/layout/user/details/detailsPage1.dart';

// class GasProds extends StatefulWidget {
//   @override
//   _GasProdsState createState() => _GasProdsState();
// }

// class _GasProdsState extends State<GasProds> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection('service_items')
//       .where('Category', isEqualTo: 'Gas')
//       .snapshots();

//   final image_link = 'assets/services/gas1.png';
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return
//             //Scaffold(
//             // resizeToAvoidBottomInset: false,
//             // body:
//             Container(
//           child: (Column(
//             //  physics: const NeverScrollableScrollPhysics(),
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;
//               return Card(
//                   clipBehavior: Clip.antiAlias,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24)),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: Padding(
//                           padding: const EdgeInsets.only(
//                             left: 35.0,
//                             top: 16,
//                           ),
//                           child: Text(
//                             'Ksh' + data['Cost'],
//                             style: GoogleFonts.openSans(
//                                 textStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         ),

//                         trailing: Icon(
//                           Icons.add_shopping_cart_outlined,
//                           color: Colors.blue,
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductDetails1(
//                                 prod_detail_name: data['Name'],
//                                 prod_detail_cost: data['Cost'],
//                                 prod_merchant: data['Category'],
//                                 prod_cat: data['Cost'],
//                                 prod_detail_picture: image_link),
//                           ));
//                         },
//                         leading: Padding(
//                           padding: const EdgeInsets.only(
//                             top: 3.7,
//                           ),
//                           child: Text(
//                             data['Name'],
//                             style: GoogleFonts.openSans(
//                                 textStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         ),
         
//                       ),
//                     ],
//                   ));
//             }).toList(),
//           )),
//         );
//       },
//     );
//   }
// }
