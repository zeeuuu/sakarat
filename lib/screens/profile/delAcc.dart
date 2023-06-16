// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../login&regist/welcome.dart';

class DelAcc extends StatefulWidget {
  const DelAcc({super.key});

  @override
  // ignore: library_private_types_in_public_api
  DelAccPageState createState() => DelAccPageState();

}

class DelAccPageState extends State<DelAcc> {

  @override
  Widget build(BuildContext context) {

    Size x = MediaQuery.of(context).size;

    final email = TextEditingController();
    final password = TextEditingController();

    Future<String> delUser(String email, String pwd) async {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: pwd)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
        // ignore: use_build_context_synchronously
        Navigator.push(context,MaterialPageRoute(
          builder: (context) {return const WelcomePage();
          }),
        );
        return email;
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Delete Account unsuccessfully')),
        );
        return ''; // akan mengembalikan fungsi kosong
      }
    }

    return Scaffold(

      body: Padding(
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
                    padding: const EdgeInsets.only(left: 10, right: 70),
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
                    'Confirmation',
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

            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 170, left: 50, right: 50),
                  child: Column(
                    children: <Widget>[

                      TextFormField(
                        controller: email,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                          icon: const Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),
                      TextFormField(
                        controller: password,
                        autofocus:false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: x.width * 0.5,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 15,
                          ),
                          onPressed: () {
                            delUser(email.text, password.text);
                          },
                          child: const Text(
                            'HAPUS',
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),              

          ]
        ),
      ),
      
    );
  }
}