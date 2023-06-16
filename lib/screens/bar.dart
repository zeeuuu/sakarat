import 'package:flutter/material.dart';
import 'package:tubes/screens/homepage.dart';
import 'package:tubes/screens/order/orders.dart';
import 'package:tubes/screens/profile/profile.dart';          
import 'package:tubes/screens/recycling.dart';

class BarPage extends StatefulWidget {
  final String username;

  const BarPage({super.key, 
    required this.username
  });

  @override
  BarPageState createState() => BarPageState();

}

class BarPageState extends State<BarPage> {
  final GlobalKey<NavigatorState> _nav = GlobalKey<NavigatorState>();
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: _nav, 
          onGenerateRoute: generateRoute,
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.green,
      showUnselectedLabels: true,
      currentIndex: idx,
      onTap: _onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.recycling), 
          label: 'Recycle'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list), 
          label: 'Orders'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), 
          label: 'Profile'
        ),
      ],
    );
  }

  _onTap(int index) {
    setState(() => idx = index);
    switch (index) {
      case 0:
        _nav.currentState?.pushReplacementNamed("Home");
        break;
      case 1:
        _nav.currentState?.pushReplacementNamed("Recycle");
        break;
      case 2:
        _nav.currentState?.pushReplacementNamed("Orders");
        break;
      case 3:
        _nav.currentState?.pushReplacementNamed("Profile");
        break;
    }
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Recycle":
        return MaterialPageRoute(builder: (context) {return RecyclePage(username: widget.username);});
      case "Orders":
        return MaterialPageRoute(builder: (context) {return OrderPage(username: widget.username);});
      case "Profile":
        return MaterialPageRoute(builder: (context) {return ProfileState(username: widget.username);});
      default:
        return MaterialPageRoute(builder: (context) {return HomePage(username: widget.username);});
    }
  }

}