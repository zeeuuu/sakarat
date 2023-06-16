import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/screens/login&regist/welcome.dart';
import 'package:tubes/screens/poin/poin.dart';
import 'package:tubes/screens/profile/about.dart';
import 'package:tubes/screens/profile/account.dart';
import 'package:tubes/screens/profile/delacc.dart';
import 'package:tubes/listvariables.dart' as listvariable;

class ProfileState extends StatelessWidget {
  final String username;

  ProfileState({super.key, 
    required this.username
  });

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          
          ProfilePict(),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () => Get.to(const PoinPage()),
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 4,
                      offset: Offset(1,4),
                    ),
                  ],
                ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const[ 
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          'Point Balance ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward, 
                        color: Colors.white
                      ),
                    ]
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    '100.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          ProfileMenu(
            text: "My Account",
            icon: const Icon(Icons.boy_rounded),
            press: () => {
              Get.to(() => AccountPage(username: listvariable.username)),
            },
          ),
          ProfileMenu(
            text: "About",
            icon: const Icon(Icons.info_outline_rounded),
            press: () {
              Get.to(const AboutPage());
            },
          ),
          ProfileMenu(
            text: "Delete Account",
            icon: const Icon(Icons.person_remove),
            press: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {

                  return AlertDialog(
                    title: const Text(
                      'Konfirmasi Hapus Akun', 
                      textAlign: TextAlign.center
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Yakin ingin menghapus akun?'),
                        SizedBox(height: 16.0),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Tidak'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Ya'),
                        onPressed: () {
                          Get.to(const DelAcc());
                        },
                      ),
                    ],
                  );
                },
              );
            },

          ),
          ProfileMenu(
            text: "Log Out",
            icon: const Icon(Icons.login),
            press: () {
              Get.to(const WelcomePage());
            },
          ),

        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  Icon icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          iconColor: const Color(0xFFF5F6F9),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
          backgroundColor: Colors.green,
        ),
        onPressed: press,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text, 
                style: const TextStyle(color: Colors.white, fontSize: 16)
              )
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfilePict extends StatelessWidget {
  ProfilePict({Key? key}) : super(key: key);

  File? _pp;
  Future<void> _editProfile() async {
    final foto = ImagePicker();
    // ignore: deprecated_member_use
    final pick = await foto.getImage(source: ImageSource.gallery);
    if (pick != null) {
      _pp = File(pick.path);
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 115,
      width: 115,

      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _pp != null ? FileImage(_pp!) : null,
            child: _pp == null
                ? const Icon(Icons.person, size: 50) // ikon default jika tidak ada foto yang dipilih
                : null,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(50),
                  side: const BorderSide(color: Colors.black),
                ),
                iconColor: Colors.black,
                backgroundColor: const Color(0xFFF5F6F9),
              ),
              onPressed: () {
                _editProfile();
              },
              child: const Icon(Icons.camera_alt_outlined)
            ),   
          ),
        ],

      ),
    );
  }
}