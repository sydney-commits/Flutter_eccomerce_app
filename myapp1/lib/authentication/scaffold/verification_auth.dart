// import 'dart:async';


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:myapp1/authentication/scaffold/header.dart';
// import 'package:myapp1/authentication/scaffold/profile.dart';
// import 'package:myapp1/authentication/scaffold/reg.dart';
// import 'package:myapp1/authentication/scaffold/theme.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

// class EmailVerificationAuthPage extends StatefulWidget {
//   @override
//   State<EmailVerificationAuthPage> createState() => _EmailVerificationAuthPageState();
// }

// class _EmailVerificationAuthPageState extends State<EmailVerificationAuthPage> {
//   bool isEmailVerified = false;
//   bool canResendMail = false;
//   Timer? timer;

//   void initState() {
//     super.initState();

//     ///User Needs to be created befre
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (!isEmailVerified) {
//       sendVerificationMail();

//       timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();

//     super.dispose();
//   }

//   Future checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser!.reload();
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });

//     if (isEmailVerified) timer?.cancel();
//   }

//   Future sendVerificationMail() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser!;
//       await user.sendEmailVerification();

//       setState(() => canResendMail = false);
//       await Future.delayed(Duration(seconds: 5));

//       setState(() => canResendMail = true);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) => isEmailVerified
//       ? ProfilePage()
//       : Scaffold(
//           appBar: AppBar(
//             title: Text("Verify Email"),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text('A Verification Message has Been sent to your Email'),
//                 ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: Size.fromHeight(50)),
//                     icon: Icon(Icons.email, size: 32),
//                     label: Text('Resent Email'),
//                     onPressed: canResendMail ? sendVerificationMail : () {}),

// SizedBox(height: 40,),
//                        ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: Size.fromHeight(50)),
//                      icon: Icon(Icons.cancel, size: 32),
//                     label: Text('Cancel'),
//                     onPressed: () => FirebaseAuth.instance.signOut(),),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Navigator.pop(context);

//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => RegistrationPage()));
//                   },
//                   child: Text('Sign Up'),
//                 ),
//               ],
//             ),
//           ),
//         );
// }
