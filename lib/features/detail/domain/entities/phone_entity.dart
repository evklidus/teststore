class DetailEntity {
  String id;
  List<String> images;
  bool isFavorites;
  String title;
  double rating;
  String cpu;
  String camera;
  String ssd;
  String sd;
  List<String> color;
  List<String> capacity;
  int price;

  DetailEntity({
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.title,
    required this.rating,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
    required this.color,
    required this.capacity,
    required this.price,
  });
}
