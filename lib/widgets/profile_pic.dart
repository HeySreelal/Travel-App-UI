import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/avatar.png"),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      width: 45,
    );
  }
}
