import 'package:flutter/material.dart';

class HongKongTitle extends StatelessWidget {
  const HongKongTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_on),
        SizedBox(
          width: 10,
        ),
        Text('Hong Kong'),
      ],
    );
  }
}
