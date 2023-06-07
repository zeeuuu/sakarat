import 'package:flutter/material.dart';
import 'package:tubes/screens/poin/received.dart';
import 'package:tubes/screens/poin/used.dart';

class PoinPage extends StatefulWidget {
  const PoinPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  PoinPageState createState() => PoinPageState();

}

class PoinPageState extends State<PoinPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: DefaultTabController(
        length: 2,
        // ignore: sort_child_properties_last
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 150,

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back, 
                color: Colors.green,
                size: 28,
              ), 
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            
            flexibleSpace: SafeArea(
              child: Column(
                children:  [

                  const SizedBox(height: 30),
                  const Text(
                    'POINTS',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 150, right: 10),
                        child: Text(
                          '100.000',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.currency_exchange, 
                          color: Colors.green
                        ),
                        onPressed: () {
                          //ke halaman tukar point
                        },
                      ),
                    ],
                  ),

                ],
              ),
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                AppBar().preferredSize.height
              ),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.green,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    tabs: const [
                      Tab(text: 'Points Received'),
                      Tab(text: 'Points Used'),
                    ],
                  ),
                ),
              ),
              )
            ),

            body: const TabBarView(
              children: [
                ReceivedPage(),
                UsedPage(),
              ],
            ),
                        
          ),

        ),
    );
  }
}
