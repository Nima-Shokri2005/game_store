import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'bottom_nav.dart';
import 'signup_screen.dart';
import '../const.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visibility = false;
  bool checkBox = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            appBar(),
            mainSection(),
            bottomSection(),
          ],
        ),
      ),
    );
  }

  Expanded mainSection() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In Now",
            style: TextStyle(
                fontSize: 25, color: primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _username,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person),
                label: const Text('Username'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username can not be empty !!!";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              obscureText: visibility,
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  icon: visibility
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                prefixIcon: const Icon(Icons.lock),
                label: const Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password can not be empty!!!";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: checkBox,
                        onChanged: (value) {
                          setState(() {
                            checkBox = value!;
                          });
                        }),
                    const Text("Remember Me"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: primaryColor),
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded bottomSection() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() && checkBox) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavWidget(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Warning!"),
                    content: const Text("Complete Inputs"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Return",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(320, 20),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Text(
            "Don't have an account?!",
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: primaryColor),
            child: const Text(
              "SignUp from here",
              style: TextStyle(color: primaryColor),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  ClipPath appBar() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: 230,
        width: double.infinity,
        color: primaryColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 45, 0, 0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Center(
                child: Image.asset('assets/images/logo.png', width: 100),
              ),
              const SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
