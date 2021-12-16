class CartEntity<basketType> {
  String id;
  List<basketType> basket;
  int total;
  String delivery;

  CartEntity({
    required this.id,
    required this.basket,
    required this.total,
    required this.delivery,
  });
}
