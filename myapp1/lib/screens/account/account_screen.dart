import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:myapp1/authentication/scaffold/login.dart';
import 'package:myapp1/authentication/scaffold/profile.dart';
import 'package:myapp1/authentication/scaffold/profile_reg.dart';

import 'package:myapp1/authentication/scaffold/wrapper_auth.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/screens/account/inbox_screen.dart';
import 'package:myapp1/screens/account/orders_screen.dart';
import 'package:myapp1/screens/account/profile.dart';
import 'package:myapp1/screens/account/profile_screen.dart';
import 'package:myapp1/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class AccountProfile extends StatefulWidget {
  static const String routeName = '/account';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => AccountProfile(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: <Widget>[
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 2,
            ),
            if (authService.currentUser1() == null)
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('User Not Logged In'),
              )
            else
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Center(
                  child: Text(
                    authService.currentUser1().email.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              // leading: Icon(Icons.home, color: Colors.blue),
              title: Text('Thanks For Shopping With Us'),
            ),
          ),
          SizedBox(height: 4),
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.person_add_alt_1_outlined, color: Colors.black),
              title: Text('Profile'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ProfileScreenEdit()));
              },
            ),
          ),
          SizedBox(height: 4),
          Card(
            child: ListTile(
              leading: Icon(Icons.shopping_bag_outlined, color: Colors.black),
              title: Text('Orders'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.mail_outline, color: Colors.black),
              title: Text('Inbox'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Inbox()));
              },
            ),
          ),

          Card(
            color: Colors.grey,
            child: ListTile(
              title: Text(''),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              onTap: () async {
                await authService.signOut();

                SystemNavigator.pop();

      
              },
              title: Text('LOGOUT'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
