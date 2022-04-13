import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/widgets/popular_card.dart';

class PopularCards extends StatelessWidget {
  const PopularCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
