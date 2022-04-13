import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class FavShareButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onTap;
  const FavShareButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: icon,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.white,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.white.withOpacity(0.1),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.white10,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
