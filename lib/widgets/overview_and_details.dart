import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/widgets/details_items.dart';

class OverviewAndDetails extends StatelessWidget {
  final Destination destination;
  const OverviewAndDetails({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                const Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 30,
                    color: TravelTheme.primaryColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  color: TravelTheme.black,
                  height: 2,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              children: const [
                Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 18,
                    color: TravelTheme.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        DetailItems(destination: destination),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
            fontSize: 14,
            color: TravelTheme.black,
          ),
        ),
      ],
    );
  }
}
