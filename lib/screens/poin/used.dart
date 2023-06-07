import 'package:flutter/material.dart';

class UsedPage extends StatefulWidget {
  const UsedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  UsedPageState createState() => UsedPageState();

}

class UsedPageState extends State<UsedPage> {

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
                          "1 Jan 2023", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        subtitle: Text(
                          "Points Expiry", 
                          style: TextStyle(
                            fontSize: 14
                          )
                        ),
                        trailing: Text(
                          "-1500", 
                          style: TextStyle(
                            color: Colors.red,
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
            //       'no history \n used',
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
