import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/widgets/detail_box.dart';

class DetailItems extends StatelessWidget {
  final Destination destination;
  const DetailItems({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailBox(
              path: "assets/icons/destination.png",
              title: "Duration",
              value: "${destination.duration} hours",
            ),
            const Spacer(),
            DetailBox(
                path: "assets/icons/star.png",
                title: "Rating",
                value: "${destination.rating} out of 5",
                iconColor: TravelTheme.ratingYellow),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        DetailBox(
          path: "assets/icons/time.png",
          title: "Timing",
          value: destination.timing,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
