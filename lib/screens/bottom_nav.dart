import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'first_screen.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';
import '../const.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  BottomNavWidgetState createState() => BottomNavWidgetState();
}

class BottomNavWidgetState extends State<BottomNavWidget> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeScreen(),
    const FirstScreen(),
    const SignInScreen(),
    const SignUpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
