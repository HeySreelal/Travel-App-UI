import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => TravelTheme.white,
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => TravelTheme.black,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
