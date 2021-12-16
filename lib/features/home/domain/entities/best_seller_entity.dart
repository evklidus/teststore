class BestSellerPhoneEntity {
  int id;
  bool isFavorites;
  String title;
  int priceWithoutDiscount;
  int discountPrice;
  String picture;

  BestSellerPhoneEntity({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });
}
