import 'package:flutter/material.dart';
import 'package:tubes/screens/login&regist/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  RegistPageState createState() => RegistPageState();

}

class RegistPageState extends State<RegistPage> {
  final _formKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();


  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    //menambahkan data
    Future<void> registerUser() {
      return users.add({
        "username": username.text,
        "email": email.text,
        "phone": phone.text,
        "password": password.text,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Registration'))
        );
        username.clear();
        email.clear();
        phone.clear();
        password.clear();
      });
    }
    
    Size x = MediaQuery.of(context).size;

    return Scaffold(
      body: Form (
        key: _formKey,
        child: Center(

          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            children: [

              //regist
              const SizedBox(height: 75),
              const Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.green,
                  fontSize: 32, 
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Create your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.green,
                  fontSize: 18
                ),
              ),

              const SizedBox(height: 15),
              Column(
                children: [

                  //username textfield
                  const SizedBox(height: 20),
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
                        return 'Enter username';
                      }
                      return null;
                    },
                  ),

                  //email textfield
                  const SizedBox(height: 20),
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

                  //no hp textfield
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phone,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      icon: const Icon(Icons.phone_android_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                  ),

                  //password textfield
                  const SizedBox(height: 20),
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

                ],
              ),
              
              //button regist
              const SizedBox(height: 50),
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
                      registerUser();
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) 
                          {return const LoginPage();}, 
                        ), 
                      );
                    }

                  //   //menampilkan pesan notes
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context){
                  //       return AlertDialog(
                  //         title: const Text('Congratss'),
                  //         content: Container(
                  //           width: 100,
                  //           height: 110,
                  //           padding: const EdgeInsets.all(5),
                  //           child: Column(
                  //             children: const [
                  //               Text(
                  //                 'Kamu sekarang jadi bagian dari SAKARAT\n',
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(
                  //                   fontSize: 21, 
                  //                   color: Colors.green,
                  //                   wordSpacing: 1,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'Yuk, mulai pilah sampah',
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(fontSize: 16)
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: (){
                  //               Navigator.push(
                  //                 context, MaterialPageRoute(builder: (context) 
                  //                   {return const LoginPage();}, 
                  //                 ), 
                  //               );
                  //             },
                  //             child: const Text('NEXT'),              
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  },

                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                  ),

                ),
              ),

              //Already have an account? Login
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [

                  TextButton(  
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?  ', 
                            style: TextStyle(
                              color:Colors.green
                            ),
                          ),
                          TextSpan(
                            text: 'Login.',
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
                          {return const LoginPage();}, 
                        ), 
                      );
                    }
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
