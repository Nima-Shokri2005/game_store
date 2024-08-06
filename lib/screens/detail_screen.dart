import 'package:flutter/material.dart';
import 'package:game_store/models/game_model.dart';
import '../const.dart';
import 'image_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.gameModel});

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                gameModel.coverImage,
                fit: BoxFit.cover,
                height: 375,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 110,
                right: MediaQuery.of(context).size.width / 2,
                child: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  height: 590,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 6,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        infoSection(),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Game',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Game Picture',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              image(context, gameModel.image1),
                              const SizedBox(
                                width: 10,
                              ),
                              image(context, gameModel.image2),
                              const SizedBox(
                                width: 10,
                              ),
                              image(context, gameModel.image3),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        elevatedButton()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding infoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customRow(Icons.download, '1M'),
              customRow(Icons.star, 'Rated'),
              customRow(Icons.phone_android, '1.5M'),
            ],
          ),
        ),
      ),
    );
  }

  Row customRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryColor,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  ElevatedButton elevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        fixedSize: const Size(300, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Install Now',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  GestureDetector image(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImageScreen(imagePath: imagePath),
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
