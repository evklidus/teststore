class HomeEntity<x, y> {
  String id;
  List<x> homeStorePhones;
  List<y> bestSellerPhones;

  HomeEntity({
    required this.id,
    required this.homeStorePhones,
    required this.bestSellerPhones,
  });
}
