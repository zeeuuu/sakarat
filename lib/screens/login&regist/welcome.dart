import 'package:flutter/material.dart';
import 'package:tubes/screens/login&regist/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  WelcomePageState createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomePage> {
  
  @override
  Widget build(BuildContext context) {

    Size x = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[

                Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: const Text(
                    'SAKARAT', 
                    style: TextStyle(
                      color:Colors.green,
                      fontSize: 32, 
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'jangan pandang sebelah mata, \ndi Sakarat justru berharga',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.green,
                    fontSize: 18,
                    wordSpacing: 2,
                  ),
                ),

              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: x.height * 0.4,
              ),
            )
          ),

          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 20,
              ),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) 
                    {return const LoginPage();}, 
                  ), 
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Get Started!',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  )
                ),
              )

            ),
          ),

        ],
      )
    );

  }
}
