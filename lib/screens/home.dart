import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/widgets/category_tiles.dart';
import 'package:travelapp/widgets/hong_kong.dart';
import 'package:travelapp/widgets/nav_button.dart';
import 'package:travelapp/widgets/popular_cards.dart';
import 'package:travelapp/widgets/popular_title.dart';
import 'package:travelapp/widgets/profile_pic.dart';
import 'package:travelapp/widgets/search_box.dart';
import 'package:travelapp/widgets/tune_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int page = 0;

  void updatePage(int p) {
    setState(() {
      page = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HongKongTitle(),
        actions: const [
          ProfilePic(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Mia!",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: TravelTheme.darkGrey,
                    ),
              ),
              Text(
                "where do you want to go?",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: TravelTheme.black,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  SearchBox(),
                  SizedBox(width: 10),
                  TuneButton(),
                ],
              ),
              const SizedBox(height: 18),
              const CategoryTiles(),
              const SizedBox(
                height: 20,
              ),
              const PopularTitle(),
              const SizedBox(
                height: 10,
              ),
              const PopularCards(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: TravelConfig.navItems
                .map(
                  (e) => NavButton(
                    selected: page,
                    item: e,
                    updateValue: updatePage,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
