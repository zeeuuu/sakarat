import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
// import 'package:tubes/screens/local_notif_service.dart';

class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  RecyclePageState createState() => RecyclePageState();

}

class RecyclePageState extends State<RecyclePage> {
  
  final List img = [
    'kertas.jpg',
    'plastik.jpg',
    'karton.jpg',
    'tekstil.jpg',
    'kaca.jpg',
    'alumunium.jpg',
    'minyak.jpg',
    'elektronik.jpg',
    'skincare.jpg',
    'lain.jpg'
  ];
  
  final List title = [
    "Kertas",
    "Plastik",
    "Karton",
    "Tekstil",
    "Kaca",
    "Alumunium",
    "Minyak Jelatah",
    "Electronic",
    "Skincare",
    "Lain-lain"
  ];

  final List point= [
    "300",
    "150",
    "100",
    "30",
    "350",
    "250",
    "25",
    "500",
    "10"
  ];

  @override
  Widget build(BuildContext context) {

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
              )
            ),
            
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 65),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(140,213,167,1.0),
                    blurRadius: 4,
                    offset: Offset(1,4),
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
                          backgroundImage: AssetImage("assets/images/sampah/${img[index]}")
                        ),

                        title: Text(
                          title[index], 
                          style: const TextStyle(fontSize: 21)
                        ),

                        subtitle:Text(
                          "${point[index]} / kg",
                          style: const TextStyle(fontSize: 16)
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 200, bottom: 15),
                        child: InputQty(
                          initVal: 0,
                          isIntrinsicWidth: true,
                          borderShape: BorderShapeBtn.circle,
                          boxDecoration: const BoxDecoration(),
                          onQtyChanged: (num? value) {  },
                        ),
                      ),
                    ],

                  )
                );

              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(130, 20, 150, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total :', 
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '0', 
                  style: TextStyle(
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
              onPressed: () {
                // LocalNotificationService().showNotification(
                //   title: 'SAKARAT',
                //   body: 'Pengajuan drop diterima',
                // );
              },
             child: const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Drop',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),
            )
            ),
          ),
          const SizedBox(height: 20),

        ],
      ),

    );
  }
}