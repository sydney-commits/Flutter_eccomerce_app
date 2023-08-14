import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp1/authentication/scaffold/login.dart';
import 'package:myapp1/authentication/scaffold/wrapper_auth.dart';
import 'package:myapp1/screens/screens.dart';



class SplashScreen1 extends StatefulWidget {

        static const String routeName = '/splash';

          static Route route() {
    return MaterialPageRoute(
        builder: (_) => SplashScreen1(),
        settings: RouteSettings(name: routeName));
  }


  // SplashScreen1({Key? key, required this.title}) : super(key: key);

  // final String title;




  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  bool _isVisible = false;

  _SplashScreen1State(){

    new Timer(const Duration(seconds: 2), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WrapperAuth()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 20),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 600),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140.0,
                width: 140.0,
                child: Center(
                  child: ClipOval(
                    child:   Image.asset(
                          "assets/icons/mylogo.jpg",
                          width: 124,
                          height: 124,
                        
                        ),
                        
                            
                    // Icon(Icons.android_outlined, size: 128,), //put your logo here
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.0,
                      offset: Offset(5.0, 3.0),
                      spreadRadius: 2.0,
                    )
                  ]
                ),
              ),

                    SizedBox(
        height: 30,
      ),
      Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: 10,horizontal: 20
        ),
          child: Text('Sydtech Delivery',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white)))

            ],
          ),
        ),
      ),
    );
  }
}