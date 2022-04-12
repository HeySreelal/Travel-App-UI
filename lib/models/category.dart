class Category {
  String name;
  String image;

  Category({required this.name, required this.image});

  String get path => "assets/icons/$image";
}
