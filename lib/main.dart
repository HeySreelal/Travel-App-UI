import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: TravelTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
