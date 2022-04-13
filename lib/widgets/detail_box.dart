import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class DetailBox extends StatelessWidget {
  final String path;
  final String title;
  final String value;
  final Color iconColor;
  const DetailBox({
    Key? key,
    required this.path,
    required this.title,
    required this.value,
    this.iconColor = TravelTheme.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage(path),
          color: iconColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: TravelTheme.darkGrey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: TravelTheme.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
