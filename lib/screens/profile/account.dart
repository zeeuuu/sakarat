import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes/listvariables.dart';
import '../login&regist/welcome.dart';

class AccountPage extends StatefulWidget {
  final String username;

  const AccountPage({super.key, 
    required this.username
  });

  @override
  // ignore: library_private_types_in_public_api
  AccountPageState createState() => AccountPageState();

}

class AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>(); 

  late TextEditingController _username; 
  late TextEditingController _email; //late agar memungkinkan dapat diubah
  late TextEditingController _phone;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    accData(); //mengambil dan menampilkan data pengguna
  }

  Future<void> accData() async {
    final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: username)
      .get();

    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      setState(() {
        _username.text = data['username'];
        _email.text = data['email'];
        _phone.text = data['phone'];
        _password.text = data['password'];
      });
    }
  }

  Future<void> updateData() async {
    final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: username)
      .get();

    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first.id;
      await FirebaseFirestore.instance
        .collection('users')
        .doc(doc)
        .update({
          'username': _username.text,
          'email': _email.text,
          'phone': _phone.text,
          'password': _password.text,
        });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    Size x = MediaQuery.of(context).size;

    return Scaffold(
      body: Form (
        key: _formKey,
        child:Padding (
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(left: 20, right: 70),
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
                        'My Account',
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
          
                          TextField(
                            controller: _username,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
          
                          const SizedBox(height: 25),
                          TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email address',
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
          
                          const SizedBox(height: 25),
                          TextField(
                            controller: _phone,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              prefixIcon: Icon(Icons.phone_android_sharp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
          
                          const SizedBox(height: 25),
                          TextField(
                            controller: _password,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                            ),
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {

                                    return AlertDialog(
                                      title: const Text(
                                        'Konfirmasi Update Data Diri', 
                                        textAlign: TextAlign.center
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: const [
                                          Text('Yakin ingin merubah informasi?'),
                                          SizedBox(height: 16.0),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Next'),
                                          onPressed: () {
                                            updateData();
                                            Get.to(const WelcomePage());
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Please re-login')),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'UPDATE',
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
        ),
      ),
    );

  }
}
