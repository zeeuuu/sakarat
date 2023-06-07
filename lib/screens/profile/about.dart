import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AboutPageState createState() => AboutPageState();

}

class AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {

    Size x = MediaQuery.of(context).size;

    return Scaffold(
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [

                Container(
                  width: x.width,
                  height: x.height * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(140,213,167,1.0),
                        blurRadius: 2,
                        offset: Offset(1,4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.only(left: 20, right: 115),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'About',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 32, 
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
          ),
          
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child:
                Text(
                  "SAKARAT is an app that protects the environment and makes waste banks one of the right solutions to reduce the amount of recycled waste. Waste banks exist to enable society to actively participate in environmentally friendly waste reduction programs. Civilians can also earn extra income by sorting waste. In addition to being beneficial to the environment and society's economy, waste banks can help society understand the importance of good and proper waste management.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    wordSpacing: 0.5
                  ),
                ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 340),
            child: 
              Text(
                'v1.1305.4',
                style: TextStyle(
                  fontSize: 16
                )
              )
          )
        ],
      ),
    );

  }
}