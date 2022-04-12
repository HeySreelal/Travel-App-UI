import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HongKongTitle(),
        actions: const [
          ProfilePic(),
        ],
      ),
      body: Padding(
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
                      (e) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                e.path,
                                height: 40,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                e.name,
                              ),
                            ],
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
