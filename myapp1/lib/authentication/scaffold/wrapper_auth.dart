

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:myapp1/authentication/scaffold/login.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/authentication/service/auth_user_model.dart';
import 'package:myapp1/authentication/service/email_verification.dart';
import 'package:provider/provider.dart';

class WrapperAuth extends StatelessWidget {

      static const String routeName = '/wrapper';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WrapperAuth(),
        settings: RouteSettings(name: routeName));
  }
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
          //  return user == null ? LoginScreen() : HomeScreen();

            if (user == null) {
              return LoginPage();
            } else {
              return EmailVerificationPage();
            }
            //LoginPage
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        });
  }
}
