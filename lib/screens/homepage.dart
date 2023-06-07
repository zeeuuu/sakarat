import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  static final List<String> img = [
    '1.png',
    '2.jpeg',
    '3.png',
    '4.jpg'
  ];

  @override
  Widget build(BuildContext context){

    Size x = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [

              Container(
                width: x.width * 1,
                height: 125,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/top.png"),
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: const [
                        Text(
                          'SAKARAT',
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.green,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Hai people!',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Colors.white, 
                        onPressed: () {
                        //bikin lokal notifikasi
                        },
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),
              CarouselSlider(
                items: img.map((i) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        // ignore: unnecessary_brace_in_string_interps
                        'assets/images/slider/${i}',
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: Text(
                  'NEWS',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [

                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/news/1.jpg'
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    autofocus: true,
                    title: const Text("Jakarta"),
                    subtitle: const Text("Peningkatan Sampah Terjadi Usai Lebaran"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () async {
                      const url = 'https://www.instagram.com';
                      if (!await launchUrl(Uri.parse(url))) {
                        throw 'Could not launch $url';
                      }
                    },
                  ),

                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/news/2.jpg'
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    title: const Text("Medan"),
                    subtitle: const Text("Bank Sampah Diharapkan Tingkatkan Konversi Sampah Jadi Pendapatan"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () async {
                      // const url = 'https://portal.pemkomedan.go.id/berita/bank-sampah-diharapkan-tingkatkan-penerapan-konversi-sampah-jadi-pendapatan__read2881.html';
                      const url = 'https://www.twitter.com';
                      if (!await launchUrl(Uri.parse(url))) {
                        throw 'Could not launch $url';
                      }
                    },
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );

  }
}