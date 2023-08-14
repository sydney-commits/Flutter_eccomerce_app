import 'package:flutter/material.dart';

import 'package:myapp1/screens/account/open_order.dart';

import 'service_reports_screen.dart';


class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Orders',
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: "Order History", ),
            Tab(text: "Service Requests",),
          
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          OrdersReportAll(),
        //  CompleteOrders(),
          ServiceList()

         // ClosedHistory(),
         
        ],
      ),
    );
  }
}
