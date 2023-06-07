import 'package:flutter/material.dart';

class OngPage extends StatefulWidget {
  const OngPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  OngPageState createState() => OngPageState();

}

class OngPageState extends State<OngPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),

          //JIKA ADA ISINYA
          child: ListView (
            shrinkWrap: true,
            children: [
              Card(
                child: Column(
                  children: [

                    const ListTile(
                      autofocus: true,
                      title: Text(
                        "DROP OFF #003", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1,
                          fontSize: 18
                        ),
                      ),
                      subtitle: Text(
                        "31 Jan 2023", 
                        style: TextStyle(
                          fontSize: 14
                        )
                      ),
                      trailing: Text(
                        "+300", 
                        style: TextStyle(
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
              ),
            ],
          ),

          //JIKA KOSONG
          // margin: const EdgeInsets.only(top: 30),
          // width: double.infinity,
          // height: 550,
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(
          //       Icons.assignment_outlined,
          //       size: 200,
          //       color: Colors.grey[200],
          //     ),
          //     Text(
          //       'no order',
          //       style: TextStyle(
          //         color: Colors.grey[200],
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
          
        ),
          
        ],
      )
    );

  }
}
