class Destination {
  int id;
  String image;
  String name;
  double rating;
  String location;
  double price;
  bool isFavourite;
  int duration;
  String timing;

  Destination({
    required this.id,
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.price,
    this.isFavourite = false,
    this.duration = 5,
    this.timing = "9 am to 10 pm",
  });

  String get path => "assets/images/$image";

  void updateFav() {
    isFavourite = !isFavourite;
  }
}
