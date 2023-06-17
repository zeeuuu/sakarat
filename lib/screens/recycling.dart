import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:tubes/listvariables.dart' as listvariable;

class RecyclePage extends StatefulWidget {
  final String username;

  const RecyclePage({super.key, 
    required this.username
  });

  @override
  RecyclePageState createState() => RecyclePageState();
}

class RecyclePageState extends State<RecyclePage> {

  final List<String> img = [
    'kertas.jpg',
    'plastik.jpg',
    'tekstil.jpg',
    'kaca.jpg',
    'minyak.jpg',
    'elektronik.jpg',
  ];

  final List<String> title = [
    "Kertas",
    "Plastik",
    "Tekstil",
    "Kaca",
    "Minyak Jelatah",
    "Electronic",
  ];

  final List<String> point = [
    "15",
    "10",
    "30",
    "25",
    "50",
    "10"
  ];

  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(title.length, 0);
  }
  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance; //inisiasi
    CollectionReference detail = firestore.collection('orderDetails'); //ngambil collection dgn nama orderdetails
    
    //untuk perhitungan 
    int total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * int.parse(point[i]);
    }

    //untuk menyimpan ke firebase
    Future<void> saveDetail(List<String> selectedItems, int total) async {
      listvariable.total = total;
      listvariable.tanggal = getCurrentDate();
      // listvariable.data++;

      await detail.add({
        'account': listvariable.username,
        // 'data' : data,
        'selected_items': selectedItems,
        'total': total,
        'tanggal': getCurrentDate(),
      });
    }

    Size x = MediaQuery.of(context).size;

    return Scaffold(

      body: Column(
        children: <Widget>[

          Container(
            width: x.width * 1,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/top.png"),
              ),
            ),

            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 65),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(140, 213, 167, 1.0),
                    blurRadius: 4,
                    offset: Offset(1, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "PILIH JENIS SAMPAHMU",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(

            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              itemCount: title.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [

                      ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              "assets/images/sampah/${img[index]}"),
                        ),

                        title: Text(
                          title[index],
                          style: const TextStyle(fontSize: 21),
                        ),

                        subtitle: Text(
                          "${point[index]} / kg",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 200, bottom: 15),
                        child: InputQty(
                          initVal: 0,
                          isIntrinsicWidth: true,
                          borderShape: BorderShapeBtn.circle,
                          boxDecoration: const BoxDecoration(),
                          onQtyChanged: (num? value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                quantities[index] = value?.toInt() ?? 0;
                              });
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(130, 20, 150, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total :',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  total.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: x.width * 0.5,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 15,
              ),

              onPressed: () async {
                List<String> selectedItems = [];
                for (int i = 0; i < quantities.length; i++) {
                  if (quantities[i] > 0) {
                    selectedItems.add("${title[i]} : ${quantities[i]}");
                  }
                }

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'DETAIL SAMPAH', 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      content: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (String item in selectedItems)
                            Column(
                              children: [
                                Text("$item kg",
                                  style: const TextStyle(fontSize: 18)
                                ),
                                const SizedBox(height: 5), // Jarak antar teks
                              ],
                            ),
                          const SizedBox(height: 20),
                          Text(
                            'Total point: $total',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Pastikan alamat pengambilan benar',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },

                ).then((value) {
                  if (total == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Select your trash first'),
                      ),
                    );
                  } else{ 
                    saveDetail(selectedItems, total);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Drop Successful'),
                    ),
                  );
                  }
                });
              },        

              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Drop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ),
          const SizedBox(height: 20),

        ],
      ),
    );

  }
}
