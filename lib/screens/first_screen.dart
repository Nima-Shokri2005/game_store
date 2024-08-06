import 'package:flutter/material.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';
import '../const.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade700,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                primaryColor,
                Colors.red.shade500,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                firstSection(),
                imageSection(),
                bottomSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded bottomSection(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 140),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "SIGN UP",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Already member?",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
            child: const Text(
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Expanded imageSection() {
    return Expanded(
      child: Image.asset(
        'assets/images/pic1.png',
        width: 250,
      ),
    );
  }

  Expanded firstSection() {
    return const Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Text(
            "Welcome to Game Pro Store",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
