import 'package:teststore/features/cart/data/models/basket_model.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity<BasketModel> {
  CartModel({
    required id,
    required basket,
    required total,
    required delivery,
  }) : super(
          id: id,
          basket: basket,
          total: total,
          delivery: delivery,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'basket': basket.map((x) => x.toMap()).toList(),
      'total': total,
      'delivery': delivery,
    };
  }

  Map<String, dynamic> toSQLite() {
    return {
      'id_sql': 1105,
      'id': id,
      'total': total,
      'delivery': delivery,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['_id'],
      basket: List<BasketModel>.from(
          map['basket'].map((x) => BasketModel.fromMap(x))),
      total: map['total'],
      delivery: map['Delivery'],
    );
  }

  updateItemsCount() {
    List<BasketModel> updatedList = [];
    updateList(BasketModel basketItem) {
      if (updatedList.contains(basketItem)) {
        final int index = updatedList.indexOf(basketItem);
        updatedList[index].count += 1;
      } else {
        updatedList.add(basketItem);
      }
    }

    for (var basketItem in basket) {
      updateList(basketItem);
    }
    basket = updatedList;
  }
}
