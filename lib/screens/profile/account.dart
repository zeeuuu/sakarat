import 'package:flutter/material.dart';

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

  late TextEditingController _username; //late agar memungkinkan dapat diubah
  final email = TextEditingController(); //email pengguna tidak boleh berubah
  late TextEditingController _phone;
  late TextEditingController _password;

  // String _username = '';

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    // accData(); //mengambil dan menampilkan data pengguna
  }

  // Future<void> accData() async {
  //   DataSnapshot snapshot =
  //         await _userRef.child(_currentUser.uid).once() as DataSnapshot;
  //     if (snapshot.value != null) {
  //       Map<dynamic, dynamic> userData = snapshot.value;
  //       setState(() {
  //         _username.text = userData['username'];
  //         email.text = userData['email'];
  //         _phone.text = userData['phone'];
  //         _password.text = userData['password'];
  //       });
  //     }
  // }
  // Future<void> updateData() async {
  //   await _userRef.child(_currentUser.uid).update({
  //     'username': _username.text,
  //     'phone': _phone.text,
  //     'password': _password.text,
  //   });
  //   // ignore: use_build_context_synchronously
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Profile updated successfully')),
  //   );
  // }

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
                            controller: email,
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
                                // updateData(); 
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
