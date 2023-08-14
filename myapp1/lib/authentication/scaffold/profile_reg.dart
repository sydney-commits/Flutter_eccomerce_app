import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/models/user_profile_model.dart';

class ProfileScreenEdit extends StatefulWidget {
  @override
  State<ProfileScreenEdit> createState() => _ProfileScreenEditState();
}

class _ProfileScreenEditState extends State<ProfileScreenEdit> {
  final _formKey = GlobalKey<FormState>();
  final controllerFname = TextEditingController();
  final controllerLname = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerContact = TextEditingController();
  final controllerLocation = TextEditingController();

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
      );

  @override
  Widget build(BuildContext context) {
    final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

    final useridentifier = _firebaseAuth.currentUser!.uid.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile Info'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("clientregistration")
            .doc(useridentifier)
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error  = ${'snapshot.error'} ');

          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            var value = output!["fname"]; // <-- Your value
            return ListView(children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 36),
                          child: buildCoverImage()),
                      Positioned(
                        top: 150,
                        child: buildProfileImage(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    output["fname"],
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Contact",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            output["contact"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.Blue3),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            output["email"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.Blue3),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            output["location"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.Blue3),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18,
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Role",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "User",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Blue3),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Center(
                    child: Text(
                      "Edit User Information",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Dark),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                    child: Divider(
                      color: Colors.blue,
                      height: 0.8,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 18, right: 18),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controllerFname,
                            decoration: decoration('UserName'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 18, right: 18),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controllerLname,
                            decoration: decoration('LastName'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 18, right: 18),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controllerLocation,
                            decoration: decoration('Location'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 18, right: 18),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controllerContact,
                            decoration: decoration('Contact'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      final userProfile = UserProfile(
                          fname: controllerFname.text,
                          lname: controllerLname.text,
                          email: controllerMail.text,
                          location: controllerLocation.text,
                          contact: controllerContact.text,
                          role: "client");

                      creteService(userProfile);
                    },
                    child: Text("Edit"),
                  )
                ],
              )
            ]);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future creteService(UserProfile userProfile) async {
    final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
    final useridentifier = _firebaseAuth.currentUser!.uid.toString();

    final docUser = FirebaseFirestore.instance
        .collection('clientregistration')
        .doc(useridentifier);
    userProfile.userId = docUser.id;

    final json = userProfile.toJson();

    await docUser.update(json);
  }
}

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/trial2app.appspot.com/o/product_image%2Fimage_picker5900237181840183951.jpg?alt=media&token=61dbfacb-fa83-48f7-ac45-ca991ebed7f0",
          width: double.infinity,
          height: 200.0,
          fit: BoxFit.cover),
    );

Widget buildProfileImage() => CircleAvatar(
      radius: 72,
      backgroundColor: Colors.grey.shade800,
      child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/trial2app.appspot.com/o/product_image%2Fimage_picker5900237181840183951.jpg?alt=media&token=61dbfacb-fa83-48f7-ac45-ca991ebed7f0"),
      // backgroundImage:Image.network('https://firebasestorage.googleapis.com/v0/b/trial2app.appspot.com/o/product_image%2Fimage_picker5900237181840183951.jpg?alt=media&token=61dbfacb-fa83-48f7-ac45-ca991ebed7f0'),
      backgroundImage: AssetImage("assets/images/syd1.jpg"),
    );
