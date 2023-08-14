import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/authentication/scaffold/login.dart';

import 'package:myapp1/authentication/scaffold/reg.dart';
import 'package:myapp1/authentication/scaffold/splash.dart';
import 'package:myapp1/helpers/appColors.dart';
import 'package:myapp1/screens/home_screen.dart';
import 'package:myapp1/screens/splash_screen.dart';

class EmailVerificationPage extends StatefulWidget {
  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isEmailVerified = false;
  bool canResendMail = false;
  Timer? timer;

  void initState() {
    super.initState();

    ///User Needs to be created befre
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationMail();

      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationMail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendMail = false);
      await Future.delayed(Duration(seconds: 5));

      setState(() => canResendMail = true);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeScreen()

      //ProfilePage
      : Scaffold(
          appBar: AppBar(
            title: Text("Email Verfication"),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    'A Verification Message has Been sent to your Email',
                    style: TextStyle(
                      color: AppColors.Blue3,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Kindly Check Your Mail',
                  style: TextStyle(
                    color: AppColors.Blue3,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shadowColor: Colors.red,
                          minimumSize: Size.fromHeight(50)),
                      icon: Icon(Icons.email, size: 32),
                      label: Text('Resend Link'),
                      onPressed: canResendMail ? sendVerificationMail : () {}),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.red,
                      minimumSize: Size.fromHeight(50)),
                  icon: Icon(Icons.cancel, size: 32),
                  label: Text('Cancel'),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // Navigator.pop(context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Navigator.pop(context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
}
