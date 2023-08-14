import 'package:flutter/material.dart';

import 'package:myapp1/screens/notifications/notification_service.dart';
import 'package:provider/provider.dart';

class Notifications123 extends StatefulWidget {

    static const String routeName = '/notifications';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => Notifications123(), settings: RouteSettings(name: routeName));
  }
  @override
  _Notifications123State createState() => _Notifications123State();
}

class _Notifications123State extends State<Notifications123> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Consumer<NotificationService>(
          builder: (context, model, _) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => model.instantNofitication("The Start"),
                      child: Text("Instant Notifications")),
                  ElevatedButton(
                      onPressed: () => model.imageNotification(),
                      child: Text("Image Notifications")),
                  ElevatedButton(
                      onPressed: () => model.stylishNotification(),
                      child: Text("Stylish Notifications")),
                  ElevatedButton(
                      onPressed: () => model.sheduledNotification(),
                      child: Text("Scheduled Notifications")),
                  ElevatedButton(
                      onPressed: () => model.cancelNotification(),
                      child: Text("Cancel Notifications")),
           
                ],
              )),
    )));
  }
}
