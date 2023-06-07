import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  HistoryPageState createState() => HistoryPageState();

}

class HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            
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
                          "PICK UP #002", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1,
                            fontSize: 18
                          ),
                        ),
                        subtitle: Text(
                          "1 Des 2022", 
                          style: TextStyle(
                            fontSize: 14
                          )
                        ),
                        trailing: Text(
                          "Failed", 
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          )
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        autofocus: true,
                        title: Text(
                          "PICK UP #001", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1,
                            fontSize: 18
                          ),
                        ),
                        subtitle: Text(
                          "27 Nov 2022", 
                          style: TextStyle(
                            fontSize: 14
                          )
                        ),
                        trailing: Text(
                          "Success", 
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

            //JIKA HISTORY KOSONG
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
            //       'no history',
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
