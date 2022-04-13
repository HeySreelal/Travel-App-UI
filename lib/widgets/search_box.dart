import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextField(
            style: const TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "Search your nearby places...",
              labelStyle: const TextStyle(
                color: TravelTheme.darkGrey,
              ),
              focusedBorder: border(),
              border: border(),
              enabledBorder: border(),
              fillColor: Colors.white,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
