import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes/screens/login&regist/welcome.dart';
import 'package:tubes/screens/poin/poin.dart';
import 'package:tubes/screens/profile/about.dart';
import 'package:tubes/screens/profile/account.dart';
import 'package:tubes/screens/profile/address.dart';

class ProfileState extends StatelessWidget {
  const ProfileState({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          
          const ProfilePict(),
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
              Get.to(const AccountPage()),
            },
          ),
          ProfileMenu(
            text: "My Address",
            icon: const Icon(Icons.cabin),
            press: () {
              Get.to(const AdrPage());
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

class ProfilePict extends StatelessWidget {
  const ProfilePict({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 115,
      width: 115,

      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/dp.jpg'),
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
                //edit gambar
              },
              child: const Icon(Icons.camera_alt_outlined)
            ),   
          ),
        ],

      ),
    );
  }
}