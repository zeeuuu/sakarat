import 'package:flutter/material.dart';
import 'package:tubes/screens/order/history.dart';
import 'package:tubes/screens/order/ongoing.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  OrderPageState createState() => OrderPageState();

}

class OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: DefaultTabController(
        length: 2,
        // ignore: sort_child_properties_last
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.white,
            title: const Text(
              'ORDERS',
              style: TextStyle(
                color: Colors.green,
                letterSpacing: 2,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              )
            ),
            
            bottom: const TabBar(
              labelColor: Colors.green,
              indicatorWeight: 3,
              // indicatorColor: Colors.green,
              tabs: [
                Tab(text: 'Ongoing Orders'),
                Tab(text: 'History'),
              ],
            ),
            
          ),

          body: const TabBarView(
            children: [
              OngPage(),
              HistoryPage(),              
            ],
          ),

        ),
      ),

    );
  }
}
