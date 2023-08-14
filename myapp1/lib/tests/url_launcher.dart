import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

_makingPhoneCall() async {
  const url = 'tel:254713711080';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_whatsapp() async {
  String phone = "2547777";
  String message = "Hello";
  String url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_textMe() async {
  // Android
  const uri = 'sms:254713711080?body=hello%20there';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    const uri = 'sms:254707683772?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

class Messaged extends StatefulWidget {
  @override
  State<Messaged> createState() => _MessagedState();
}

class _MessagedState extends State<Messaged> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 20.0,
                  ),
                  Container(
                    child: Text(
                      'Call To Order',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                  ),
                  RaisedButton(
                    //  color: Colors.green,
                    onPressed: _makingPhoneCall,
                    child:
                        Image.network("https://firebasestorage.googleapis.com/v0/b/trial2app.appspot.com/o/product_image%2Fimage_picker8845603956696091667.jpg?alt=media&token=92fe675d-2a36-4b31-94e3-8be2ce0df795", width: 60),
                    //Text('Call'),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Container(
                    height: 30.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'WhatsApp',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 20.0,
                  ),
                  RaisedButton(
                    // color: Colors.teal,
                    onPressed: _whatsapp,
                    child:
                        Image.network("https://firebasestorage.googleapis.com/v0/b/trial2app.appspot.com/o/product_image%2Fimage_picker8845603956696091667.jpg?alt=media&token=92fe675d-2a36-4b31-94e3-8be2ce0df795", width: 60),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                  ),
                ],
              ),
            ),
            Container(
              height: 30.0,
            ),
          ],
        ),
      ],
    );
  }
}
