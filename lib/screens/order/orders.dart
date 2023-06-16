import 'package:flutter/material.dart';
import 'history.dart';
import 'ongoing.dart';
import 'package:tubes/listvariables.dart' as listvariable;

class OrderPage extends StatefulWidget {
  final String username;

  const OrderPage({super.key, 
    required this.username
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: DefaultTabController(
        length: 2,
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
              ),
            ),

            bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.green,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Ongoing Orders'),
                Tab(text: 'History'),
              ],
            ),
          ),

          body: TabBarView(
            controller: _tabController,
            children: [
              const OngPage(),
              HistoryPage(order: const {}, status: '', username: listvariable.username),
            ],
          ),

        ),
      ),
    );

  }
}
