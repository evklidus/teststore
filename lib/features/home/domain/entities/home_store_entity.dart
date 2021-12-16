class HomeStorePhoneEntity {
  int id;
  bool isNew;
  bool isFavorites;
  String title;
  String subtitle;
  String picture;
  bool isBuy;

  HomeStorePhoneEntity({
    required this.id,
    required this.isNew,
    required this.isFavorites,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });
}
