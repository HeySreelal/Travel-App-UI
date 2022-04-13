import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class BookNow extends StatelessWidget {
  const BookNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(
        bottom: 18,
        top: 10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0),
            TravelTheme.white,
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 50,
          width: 150,
          child: TextButton(
            onPressed: () {},
            child: const Text("Book Now"),
            style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith(
                (states) => 0,
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => TravelTheme.primaryColor,
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => TravelTheme.white,
              ),
              overlayColor: MaterialStateProperty.resolveWith(
                (states) => TravelTheme.white.withOpacity(0.2),
              ),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
