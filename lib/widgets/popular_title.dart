import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class PopularTitle extends StatelessWidget {
  const PopularTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
