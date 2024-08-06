import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'bottom_nav.dart';
import 'signin_screen.dart';
import '../const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool showRepeatPassword = true;
  bool checkBox = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _repeatPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [appBar(), mainSection()],
          ),
        ),
      ),
    );
  }

  Column mainSection() {
    return Column(
      children: [
        const Text(
          "Create Account",
          style: TextStyle(
            fontSize: 25,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
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
              labelText: 'username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Username can not be empty!!!';
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
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.email),
              labelText: 'email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email can not be empty!!!';
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
            controller: _password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: showPassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: showPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(
                        Icons.visibility,
                      ),
              ),
              prefixIcon: const Icon(Icons.lock),
              labelText: 'password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password can not be empty!!!';
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
            controller: _repeatPassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: showRepeatPassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showRepeatPassword = !showRepeatPassword;
                    });
                  },
                  icon: showRepeatPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(
                          Icons.visibility,
                        )),
              prefixIcon: const Icon(Icons.lock),
              labelText: 'repeat password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 3, color: primaryColor),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Repeat Password can not be empty!!!';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Checkbox(
                  value: checkBox,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                  }),
              const Text("Agree To The"),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: primaryColor),
                child: const Text(
                  "Terms And Services",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate() &&
                _password.text == _repeatPassword.text &&
                checkBox) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomNavWidget(),
              ));
            } else if (_formKey.currentState!.validate() &&
                _password != _repeatPassword &&
                checkBox) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Warning!"),
                  content: const Text("Password Don't Match"),
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
            backgroundColor: primaryColor,
            fixedSize: const Size(320, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ));
          },
          style: TextButton.styleFrom(foregroundColor: primaryColor),
          child: const Text(
            'SignIn from here',
            style: TextStyle(color: primaryColor),
          ),
        ),
      ],
    );
  }

  ClipPath appBar() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: 230,
        width: double.infinity,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 45, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
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
