// import 'dart:async';

// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
// //  const CatalogScreen({Key? key}) : super(key: key);
//   static const String routeName = '/splash12';

//   static Route route() {
//     return MaterialPageRoute(
//         builder: (_) => SplashScreen(),
//         settings: RouteSettings(name: routeName));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Timer(Duration(seconds:8), () => Navigator.pushNamed(context, '/wrapper'));
//     return Scaffold(
//         body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Center(

  
//         child: Image.asset(
//           'assets/icons/mylogo.jpg',
//           width: 125,
//           height: 125,
//         ),
//       ),
//       SizedBox(
//         height: 30,
//       ),
//       Container(
//         color: Colors.black,
//         padding: EdgeInsets.symmetric(
//           vertical: 10,horizontal: 20
//         ),
//           child: Text('Sydtech Delivery',
//               style: Theme.of(context)
//                   .textTheme
//                   .headline2!
//                   .copyWith(color: Colors.white)))
//     ]));
//   }
// }
