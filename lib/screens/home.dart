import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/models/nav_item.dart';
import 'package:travelapp/screens/details.dart';
import 'package:travelapp/utils/slide.dart';

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TravelConfig.categories
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              e.path,
                              height: 40,
                            ),
                            label: Text(e.name),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => TravelTheme.white,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      "Popular",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: TravelTheme.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const Text(
                    "View All",
                    style: TextStyle(
                      color: TravelTheme.darkGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(height: 30),
                    for (var item in TravelConfig.destinations) ...[
                      PopularCard(item),
                      if (item.id > 0) const SizedBox(width: 20),
                    ],
                  ],
                ),
              ),
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

class NavButton extends StatelessWidget {
  final int selected;
  final NavigationItem item;
  final ValueChanged<int> updateValue;
  const NavButton({
    Key? key,
    required this.selected,
    required this.item,
    required this.updateValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return selected == item.id
        ? TextButton.icon(
            onPressed: () {
              updateValue(item.id);
            },
            icon: item.filled,
            label: Text(item.title),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => TravelTheme.primaryColor.withOpacity(0.1),
              ),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        : TextButton(
            onPressed: () {
              updateValue(item.id);
            },
            child: item.outlined,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => TravelTheme.darkGrey,
              ),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
  }
}

class PopularCard extends StatelessWidget {
  final Destination destination;
  const PopularCard(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          slidingRoute(
            DetailsPage(destination),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: TravelTheme.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(4, 0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.all(0),
              child: Hero(
                tag: destination.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    destination.path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Disney Land",
              style: TextStyle(
                fontSize: 20,
                color: TravelTheme.darkGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location,
                  color: TravelTheme.grey,
                ),
                Text(
                  destination.location,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: TravelTheme.grey,
                      ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: TravelTheme.grey,
                ),
                Text(
                  "${destination.rating} Rating",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: TravelTheme.grey,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TuneButton extends StatelessWidget {
  const TuneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const ImageIcon(
        AssetImage("assets/icons/settings.png"),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.primaryColor,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.white,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.white.withAlpha(30),
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.all(10),
        ),
      ),
    );
  }
}

class HongKongTitle extends StatelessWidget {
  const HongKongTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_on),
        SizedBox(
          width: 10,
        ),
        Text('Hong Kong'),
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/avatar.png"),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      width: 45,
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextField(
            style: const TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "Search your nearby places...",
              labelStyle: const TextStyle(
                color: TravelTheme.darkGrey,
              ),
              focusedBorder: border(),
              border: border(),
              enabledBorder: border(),
              fillColor: Colors.white,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
