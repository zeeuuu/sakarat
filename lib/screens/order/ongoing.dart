import 'package:flutter/material.dart';
import 'package:tubes/listvariables.dart' as listvariable;

class OngPage extends StatefulWidget {
  final String username;

  const OngPage({super.key, 
    required this.username
  });

  @override
  OngPageState createState() => OngPageState();
}

class OngPageState extends State<OngPage> {
  List<Map<String, dynamic>> order = [];
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();

    //Add some dummy data to the history list
    order.add({
      'id': '#001',
      'date': '27 Nov 2022',
      'point': '+300',
    });
    order.add({
      'id': '#002',
      'date': '31 Jan 2023',
      'point': '+32',
    });
  }

  void statOrder(int index) {
    setState(() {
      final stat = order.removeAt(index);
      history.add(stat);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),

            child: order.isEmpty ?
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
                      'no order',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ) :

              ListView.builder(
                shrinkWrap: true,
                itemCount: order.length,
                itemBuilder: (context, index) {
                  final item = order[index];
                  return Card(
                    child: Column(
                      children: [

                        ListTile(
                          autofocus: true,
                          title: Text(
                            item['id'], 
                            // '#00',
                            // listvariable.data as String, 
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              wordSpacing: 1,
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text(
                            item['date'], 
                            // listvariable.tanggal, 
                            style: const TextStyle(
                              fontSize: 14
                            )
                          ),
                          trailing: Text(
                            item['point'], 
                            // listvariable.total as String, 
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            )
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 5, 20, 20),
                          child: Row(
                            children: [

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                  ),
                                  onPressed: () {
                                    statOrder(index);
                                    listvariable.status = false;
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white, 
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                  ),
                                  onPressed: () {
                                    statOrder(index);
                                    listvariable.status = true;
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Colors.white, 
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ),

                      ],
                    ),
                  );
                }
              ),
          
          ),
          
        ],
      )
    );

  }
}
