import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final dynamic order;
  final dynamic status;
  final String username;

  const HistoryPage({
    Key? key,
    required this.order,
    required this.status,
    required this.username
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),

            child: widget.order.isEmpty? 
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      size: 200,
                      color: Colors.grey[200],
                    ),
                    Text(
                      'no history',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ) : 

              ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: ListTile(
                      autofocus: true,
                      title: Text(
                        "Order ${widget.order['id']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "${widget.order['date']}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      trailing: Text(
                        widget.status,
                        style: TextStyle(
                          color: widget.status == 'Success'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          ),
        ],

      ),
    );

  }
}
