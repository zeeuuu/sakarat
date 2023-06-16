import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OngPage extends StatefulWidget {
  const OngPage({Key? key}) : super(key: key);

  @override
  OngPageState createState() => OngPageState();
}

class OngPageState extends State<OngPage> {
  List<Map<String, dynamic>> order = [];
  List<Map<String, dynamic>> history = [];
  
  CollectionReference detail = FirebaseFirestore.instance.collection('orderDetails');

  // Future<void> ambilData() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = detail.get() as QuerySnapshot<Map<String, dynamic>>;
  //   if (snapshot.docs.isNotEmpty) {
  //     setState(() {
  //       order = snapshot.docs.map((doc) => doc.data()).toList();
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // ambilData();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   //Add some dummy data to the history list
  //   order.add({
  //     'id': '#001',
  //     'date': '27 Nov 2022',
  //     'point': '+300',
  //   });
  //   order.add({
  //     'id': '#002',
  //     'date': '31 Jan 2023',
  //     'point': '+32',
  //   });
  // }

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

            child: order.isEmpty ? //cek history 
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
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              wordSpacing: 1,
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text(
                            item['date'], 
                            style: const TextStyle(
                              fontSize: 14
                            )
                          ),
                          trailing: Text(
                             item['point'], 
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
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                                    //  => OrderPage(order: item, status: 'Failed'),
                                    // ));
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
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)
                                    //  => OrderPage(order: item, status: 'Success'),
                                    // ));
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
