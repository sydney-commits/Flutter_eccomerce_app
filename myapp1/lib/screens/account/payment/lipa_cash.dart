// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart'; //Import the plugin

class LipaCashScreen extends StatefulWidget {
  static const String routeName = '/lipacash';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LipaCashScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  _LipaCashScreenState createState() => _LipaCashScreenState();
}

class _LipaCashScreenState extends State<LipaCashScreen> {
  Future<void> startCheckout(
      {required String userPhone, required double amount}) async {
    //Preferably expect 'dynamic', response type varies a lot!
    dynamic transactionInitialisation;
    //Better wrap in a try-catch for lots of reasons.
    try {
      //Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: amount,
              partyA: userPhone,
              partyB: "174379",
              // callBackURL: Uri(scheme: "https", host : "1234.1234.co.ke", path: "/1234.php"),
              callBackURL: Uri(
                  scheme: "https",
                  host: "mpesa-requestbin.herokuapp.com",
                  path: "/1hhy6391"),
              accountReference: "Our Business Payment Service",
              phoneNumber: userPhone,
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "purchase",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());

      return transactionInitialisation;
    } catch (e) {
      //For now, console might be useful
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mpesa Payment '),
        ),
        body: Card(
          elevation: 4.0,
          child: Expanded(
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  print("-------------------------------------------------");
                  startCheckout(
                    userPhone: "254707683772",
                    amount: 1.0,
                  );
                },
                child: Text("Make Payment Now")),
          ),
        ),
      ),
    );
  }
}

Future<void> startCheckout(
    {required String userPhone, required double amount}) async {
  //Preferably expect 'dynamic', response type varies a lot!
  dynamic transactionInitialisation;
  //Better wrap in a try-catch for lots of reasons.
  try {
    //Run it
    transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: "174379",
        transactionType: TransactionType.CustomerPayBillOnline,
        amount: amount,
        partyA: userPhone,
        partyB: "174379",
        // callBackURL: Uri(scheme: "https", host : "1234.1234.co.ke", path: "/1234.php"),
        callBackURL: Uri(
            scheme: "https",
            host: "mpesa-requestbin.herokuapp.com",
            path: "/1hhy6391"),
        accountReference: "Our Business Payment Service",
        phoneNumber: userPhone,
        baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
        transactionDesc: "purchase",
        passKey:
            "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

    print("TRANSACTION RESULT: " + transactionInitialisation.toString());

    return transactionInitialisation;
  } catch (e) {
    //For now, console might be useful
    print("CAUGHT EXCEPTION: " + e.toString());
  }
}
