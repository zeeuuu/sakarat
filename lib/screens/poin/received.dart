import 'package:flutter/material.dart';

class ReceivedPage extends StatefulWidget {
  const ReceivedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ReceivedPageState createState() => ReceivedPageState();

}

class ReceivedPageState extends State<ReceivedPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      
            //JIKA ADA ISINYA
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: const [

                    Card(
                      child: ListTile(
                        autofocus: true,
                        title: Text(
                          "31 Jan 2023", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        subtitle: Text(
                          "Drop Off #003", 
                          style: TextStyle(
                            fontSize: 14
                          )
                        ),
                        trailing: Text(
                          "+300", 
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          )
                        ),
                      ),
                    ),

                    Card(
                      child: ListTile(
                        autofocus: true,
                        title: Text(
                          "27 Nov 2022", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        subtitle: Text(
                          "Pickup #001", 
                          style: TextStyle(
                            fontSize: 14
                          )
                        ),
                        trailing: Text(
                          "+690", 
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          )
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),

            //JIKA KOSONG
            // margin: const EdgeInsets.only(top: 10),
            // width: double.infinity,
            // height: 550,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.wallet,
            //       size: 200,
            //       color: Colors.grey[200],
            //     ),
            //     Text(
            //       'no points \n received',
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
