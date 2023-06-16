// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tubes/screens/bar.dart';
import 'package:tubes/screens/login&regist/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubes/listvariables.dart' as listvariable;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  LoginPageState createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); //key untuk membuat form yg dapat menerima input

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    //memvalidasi data dari firebasee
    Future<String> loginUser(String usr, String pwd) async { //akan mengembalikan string
      final snapshot = await users //snapshot akan menampung hasil get 
        .where('username', isEqualTo: usr)
        .where('password', isEqualTo: pwd)
        .get();

      if(snapshot.docs.isNotEmpty) { //memerika data yg ditemukan sebelumnya, jika tdk kosong
        // ignore: unused_local_variable
        var loggedInUserId = snapshot.docs[0].id;
        listvariable.username = usr;
        // ignore: use_build_context_synchronously
        Navigator.push(
          context, MaterialPageRoute(builder: (context) 
            {return BarPage(username: usr);}, 
          ),
        );
        return usr;
      }else { //jika tdk ditemukan
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged in unsuccessfully'))
        );
        return ''; //akan mengembalikan fungsi kosong
      }
    }

    Size x = MediaQuery.of(context).size; 

    return Scaffold(
      body: Form (
        key: _formKey,
        child: Center(
          
          child: ListView(
            padding: const EdgeInsets.only(left: 50, right: 50),
            children: [

              //login
              const SizedBox(height: 100),
              const Text(
                'Welcome Back', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.green,
                  fontSize: 32, 
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Login to your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.green,
                  fontSize: 18, 
                ),
              ),

              const SizedBox(height: 25),
              Column(
                children: [

                  //username textfield
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: username,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      icon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Username';
                      }
                      return null;
                    },
                  ),

                  //password textfield
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: password,
                    autofocus: false,
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

                  //Forgot Password?
                  const SizedBox(height: 5),
                  TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                          style : TextStyle(color: Colors.green)
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder: (context) 
                      //     {return const HintPage();}, 
                      //   ), 
                      // );
                    },
                  ),

                ],
              ),
              
              //button login
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: x.width * 0.7,
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
                    if (_formKey.currentState!.validate()) {
                      loginUser(username.text, password.text);
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
              ),

              //Does not have account? Sign Up.
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [

                  TextButton(
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Does not have account?  ', 
                            style: TextStyle(
                              color:Colors.green
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up.',
                            style: TextStyle(
                              color:Colors.green,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ]
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) 
                          {return const RegistPage();}, 
                        ), 
                      );
                    },
                  ),

                ]
              ),

            ],
          ),

        ),
      ),
    );

  }
}
