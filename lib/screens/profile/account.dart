import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AccountPageState createState() => AccountPageState();

}

class AccountPageState extends State<AccountPage> {

  // //buat yg di account
  // void getData() async{
  //   users = firebase.collection('users');

  //   if (widget.id != null) {
  //     var data = await users!.doc(widget.id).get();
  //     var item = data.data() as Map<String, dynamic>;

  //     setState(() {-
  //       username = TextEditingController(text: item['name']);
  //       email = TextEditingController(text: item['phoneNumber']);
  //       phone= TextEditingController(text: item['email']);
  //       password = TextEditingController(text: item['address']);
  //     });
  //   }
  // }
  //   @override
  //   void initState() {
  //     getData();
  //     super.initState();
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    Size x = MediaQuery.of(context).size;

    TextEditingController name = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Padding(
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
        
                        TextField (
                          controller: name,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.people),
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
                          controller: username,
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
                          controller: phone,
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
                          controller: password,
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
    );

  }
}
