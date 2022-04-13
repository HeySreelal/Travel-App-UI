import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

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
