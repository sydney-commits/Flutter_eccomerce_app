import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/authentication/scaffold/wrapper_auth.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/models/service_checkout_model.dart';
import 'package:myapp1/models/user_profile_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ProfilePageScreen extends StatelessWidget {
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        //  border:
      );

  final controllerFname = TextEditingController();
  final controllerLname = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerContact = TextEditingController();
  final controllerLocation = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // final String category;

  // ProfilePageScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(' Registration'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 5, left: 5),
                    child: Text('Client Details',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black, fontSize: 15),),
                  )),
                  // Text(authService.currentUser1().uid.toString()),
                  // Text(authService.currentUser1().email.toString()),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: controllerFname,
                    decoration: decoration('FirstName'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: controllerLname,
                    decoration: decoration('Last Name'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Location';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: controllerLocation,
                    decoration: decoration('Location'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Contact';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: controllerContact,
                    decoration: decoration('Contact'),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WrapperAuth()));

                          //   Navigator.pop(context);
                          final userProfile = UserProfile(
                              fname: controllerFname.text,
                              lname: controllerLname.text,
                              location: controllerLocation.text,
                              contact: controllerContact.text,
                              role: 'client',
                              email:
                                  authService.currentUser1().email.toString(),
                              userUid:
                                  authService.currentUser1().uid.toString());

                          creteService(userProfile);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'User Information Created Successfully')));
                        }
                      },
                      child: Text(
                        "Submit",
                        //   authService.currentUserId(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Future creteService(UserProfile userProfile) async {
    final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

    final useridentifier = _firebaseAuth.currentUser!.uid.toString();

    final docUser = FirebaseFirestore.instance
        .collection('clientregistration')
        .doc(useridentifier);
    userProfile.userId = docUser.id;

    final json = userProfile.toJson();

    await docUser.set(json);
  }
}
