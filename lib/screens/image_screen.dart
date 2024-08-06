import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Hero(
        tag: imagePath,
        child: Center(
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
