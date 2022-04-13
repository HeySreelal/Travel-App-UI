import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/nav_item.dart';

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
