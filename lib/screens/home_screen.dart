import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:game_store/models/game_model.dart';
import 'detail_screen.dart';
import '../const.dart';

enum Category { racing, strategy, baby, other }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category enumState = Category.racing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            searchBar(),
            categoriesSection(),
            trendingSection(),
            newGameSection(),
          ],
        ),
      ),
    );
  }

  Padding newGameSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Game',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: GameModel.gameModelList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              gameModel: GameModel.gameModelList[index]),
                        ));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 150,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    GameModel.gameModelList[index].coverImage,
                                    width: 150,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      GameModel.gameModelList[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      GameModel.gameModelList[index].category,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.orange.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(GameModel
                                                    .gameModelList[index]
                                                    .score),
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(100, 40),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: const Text(
                                              'Install',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding trendingSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              itemCount: GameModel.gameModelList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TrendingItemWidget(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column categoriesSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              item(
                  icon: Icons.car_crash,
                  name: 'Racing',
                  currentState: Category.racing),
              item(
                  icon: Icons.castle,
                  name: 'Strategy',
                  currentState: Category.strategy),
              item(
                  icon: Icons.child_care,
                  name: 'Baby',
                  currentState: Category.baby),
              item(
                  icon: Icons.more_horiz,
                  name: 'Other',
                  currentState: Category.other),
            ],
          ),
        ),
      ],
    );
  }

  Container item(
      {required IconData icon,
      required String name,
      required Category currentState}) {
    Color textColor = defineColor(currentState)[0];
    Color backgroundColor = defineColor(currentState)[1];
    return Container(
      height: 35,
      width: 110,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                enumState = currentState;
              });
            },
            child: Row(
              children: [
                Icon(
                  icon,
                  color: textColor,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> defineColor(Category currentState) {
    if (enumState == currentState) {
      return [primaryColor, Colors.red.shade100];
    } else {
      return [Colors.black, Colors.grey.shade100];
    }
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 8,
              ),
              Text('Search Games'),
            ],
          ),
          Icon(Icons.menu),
        ],
      ),
    );
  }

  Row appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.fromLTRB(15, 0, 0, 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: primaryColor,
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        Container(
          width: 125,
          height: 50,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 25),
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.amber,
                ),
              ),
              Text(
                '123456',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingItemWidget extends StatelessWidget {
  const TrendingItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              fit: BoxFit.cover,
              width: 180,
              height: 250,
              GameModel.gameModelList[index].coverImage,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: SizedBox(
                width: 180,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        GameModel.gameModelList[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        GameModel.gameModelList[index].category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            GameModel.gameModelList[index].score,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Install',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
