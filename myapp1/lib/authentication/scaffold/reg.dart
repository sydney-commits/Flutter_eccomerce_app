import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/authentication/scaffold/header.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/authentication/service/custom_text_widget.dart';
import 'package:myapp1/screens/account/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatelessWidget {
  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => RegistrationPage(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    FirebaseAuth auth = FirebaseAuth.instance;

    // FirebaseAuth auth = FirebaseAuth.instance.currentUser();
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
        child: ListView(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.home_max_rounded),
            ),
            const SizedBox(
              height: 20,
            ),

                                Center(
                                  child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 30,color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                                ),

                                   const SizedBox(
              height: 20,
            ),

            CustomTextField1(
              hint: 'E-mail address',
              controller: emailController,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField1(
              hint: 'Password',
              controller: passwordController,
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () async {
                //
                await authService.createUserWithEmailAndPassword(
                    emailController.text, passwordController.text);

            

                // await FirebaseFirestore.instance
                //     .collection('Users')
                //     .doc(authService.currentUserId().toString())
                //     .set({"email": "dsasdf"});

                // Navigator.pop(context);

           await Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageScreen()));

                

                // print(emailController.text);
                // print(passwordController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors

// import 'package:auth_project/auth/auth_service.dart';
// import 'package:auth_project/auth/email_verification.dart';
// import 'package:auth_project/auth/scaffold/header.dart';
// import 'package:auth_project/auth/scaffold/profile.dart';
// import 'package:auth_project/auth/scaffold/theme.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';

// class RegistrationPage extends  StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//      return _RegistrationPageState();
//   }
// }

// class _RegistrationPageState extends State<RegistrationPage>{

//   final _formKey = GlobalKey<FormState>();
//   bool checkedValue = false;
//   bool checkboxValue = false;

//   @override
//   Widget build(BuildContext context) {

//        final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final authService = Provider.of<AuthService>(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height: 150,

//               child: HeaderWidget(150, false, Icons.home_max_rounded),
//             ),
//             Container(

//               margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
//               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           child: Stack(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   border: Border.all(
//                                       width: 5, color: Colors.white),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black12,
//                                       blurRadius: 20,
//                                       offset: const Offset(5, 5),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Icon(
//                                   Icons.person,
//                                   color: Colors.grey.shade300,
//                                   size: 80.0,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
//                                 child: Icon(
//                                   Icons.add_circle,
//                                   color: Colors.grey.shade700,
//                                   size: 25.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 30,),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 30,),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//               controller: emailController,

//                             decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
//                                 return "Enter a valid email address";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Mobile Number",
//                                 "Enter your mobile number"),
//                             keyboardType: TextInputType.phone,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
//                                 return "Enter a valid phone number";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//               controller: passwordController,

//                             obscureText: true,
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Password*", "Enter your password"),
//                             validator: (val) {
//                               if (val!.isEmpty) {
//                                 return "Please enter your password";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 15.0),
//                         FormField<bool>(
//                           builder: (state) {
//                             return Column(
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     Checkbox(
//                                         value: checkboxValue,
//                                         onChanged: (value) {
//                                           setState(() {
//                                             checkboxValue = value!;
//                                             state.didChange(value);
//                                           });
//                                         }),
//                                     Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
//                                   ],
//                                 ),
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     state.errorText ?? '',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                           validator: (value) {
//                             if (!checkboxValue) {
//                               return 'You need to accept terms and conditions';
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           decoration: ThemeHelper().buttonBoxDecoration(context),
//                           child: ElevatedButton(
//                             style: ThemeHelper().buttonStyle(),
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                               child: Text(
//                                 "Register".toUpperCase(),
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () async{
//                                await authService.createUserWithEmailAndPassword(
//                     emailController.text, passwordController.text);

//                 Navigator.pop(context);

//                     //             await authService.signInWithEmailAndPassword(
//                     // emailController.text, passwordController.text);
//                               // if (_formKey.currentState!.validate()) {
//                               //   Navigator.of(context).pushAndRemoveUntil(
//                               //       MaterialPageRoute(
//                               //           builder: (context) => EmailVerificationPage()
//                               //       ),
//                               //           (Route<dynamic> route) => false
//                               //   );

//                               // }
//                             },
//                           ),
//                         ),

//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }
