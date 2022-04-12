import 'package:flutter/material.dart';
import 'package:travelapp/models/category.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/models/nav_item.dart';

class TravelTheme {
  static const Color scaffoldBackgroundColor = Color(0xFFEBF2FC);
  static const Color primaryColor = Color(0xFF329BCE);
  static const Color grey = Color(0xFFC0BFBD);
  static const Color darkGrey = Color(0xFF878787);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: white,
          surface: scaffoldBackgroundColor,
          onSurface: white,
          background: scaffoldBackgroundColor,
          onBackground: white,
          error: Colors.red,
          onError: white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
            headline6: TextStyle(
          fontSize: 22,
        )),
        appBarTheme: const AppBarTheme(
          titleSpacing: 8,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: primaryColor,
        ),
        iconTheme: const IconThemeData(
          color: black,
        ),
      );
}

class TravelConfig {
  static List<Category> categories = [
    Category(
      name: 'Theme Park',
      image: 'ThemePark.png',
    ),
    Category(
      name: 'Pub & Club',
      image: 'disco.png',
    ),
    Category(
      name: 'Cafes',
      image: 'cafe.png',
    ),
    Category(
      name: 'Concerts',
      image: 'rock-and-roll.png',
    ),
    Category(
      name: 'Activities',
      image: 'camping-tent.png',
    ),
  ];

  static List<Destination> destinations = [
    Destination(
      id: 1,
      image: "disneyland.jpeg",
      name: "Disney Land",
      rating: 4.8,
      location: "California",
      price: 120,
    ),
    Destination(
      id: 2,
      image: "pacific-park.jpeg",
      name: "Pacific Park",
      rating: 4.3,
      location: "California",
      price: 99,
    ),
    Destination(
      id: 3,
      image: "eiffel-tower.jpeg",
      name: "Eiffel Tower",
      rating: 4.9,
      location: "Paris",
      price: 120,
    ),
  ];

  static List<NavigationItem> navItems = [
    NavigationItem(
      id: 0,
      filled: const Icon(Icons.home),
      outlined: const Icon(Icons.home_outlined),
      title: "Home",
    ),
    NavigationItem(
      id: 1,
      filled: const Icon(Icons.notifications),
      outlined: const Icon(Icons.notifications_outlined),
      title: "Updates",
    ),
    NavigationItem(
      id: 2,
      filled: const Icon(Icons.favorite),
      outlined: const Icon(Icons.favorite_border_outlined),
      title: "Favorites",
    ),
    NavigationItem(
      id: 3,
      filled: const Icon(Icons.person),
      outlined: const Icon(Icons.person_outline),
      title: "Profile",
    ),
  ];
}
