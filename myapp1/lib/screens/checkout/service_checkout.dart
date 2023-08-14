
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/models/service_checkout_model.dart';
import 'package:myapp1/screens/notifications/notification_service.dart';
import 'package:provider/provider.dart';



class ServiceCheckout extends StatelessWidget {
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        //  border:
      );

  final controllerName = TextEditingController();
  final controllerContact = TextEditingController();
  final controllerRemark = TextEditingController();
  final controllerLocation = TextEditingController();

  final String category;

  ServiceCheckout(this.category);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: controllerName,
                    decoration: decoration('Client Name'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Location';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: controllerLocation,
                    decoration: decoration('Location'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Contact';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: controllerContact,
                    decoration: decoration('Contact'),
                  ),
                  TextFormField(
                    minLines: 2,
                    maxLines: 3,
                    controller: controllerRemark,
                    decoration: decoration('Remark'),
                  ),
                ],
              ),
            ),
            Center(
                child: Consumer<NotificationService>(
              builder: (context, model, _) => Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      final serviceCheckout1 = ServiceCheckout1(
                        name: controllerName.text,
                        location: controllerLocation.text,
                        contact: controllerContact.text,
                        remark: controllerRemark.text,
                        serviceType: category,
                        userId: authService.currentUser1().uid.toString(),
                        isAccepted: false,
                        isAuthorised: false,
                        isCancelled: false,
                        isDelivered: false,
                        createdAt: DateTime.now(),
                        deliveredAt: DateTime.now()
                      );
                      creteService(serviceCheckout1);

                      model.instantNofitication(
                          'Thanks For The Order Of ${category}, We shall Get Back to You');

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Request For Service sent , We shall get Back to You'),
                             // backgroundColor: AppColors.Blue3,
                              ));
                    }
                  },
                  child: Text("Request Service",
                      style: Theme.of(context)
                   
                         .textTheme
                          .headline3!
                          .copyWith(color: Colors.white)),
                ),
              ),
            )),





             
          

        
        
          ],
        ),
      ),
    );
  }

  Future creteService(ServiceCheckout1 serviceCheckout) async {
    final docUser =
        FirebaseFirestore.instance.collection('service_order').doc();
    serviceCheckout.serviceNumber = docUser.id;

    final json = serviceCheckout.toJson();

    await docUser.set(json);
  }

  // _whatsapp() async {
  //   String phone = "254713711080";
  //   String message = "Hello";
  //   String url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
