import 'package:get/get.dart';
import 'package:f_shopping_app/domain/models/product.dart';

enum QuantityType {
  positive,
  negative
}

class CartController extends GetxController {
  final _total = 0.obs;
  final _products = RxList([Product(0, "Toy car", 10), Product(1, "Toy house", 20)]).obs;

  get products => _products.value; 
  get total => _total; 

  void updateCart() {
    _total.value = 0;
    for (var item in _products.value) {
      _total.value += (item.price * item.quantity);
    }
  }
  
  void updateItem(int id, QuantityType type ) {
    int numToAdd = (type == QuantityType.positive) ? 1 : -1;
    for (var item in _products.value) {
      if(item.id == id) {
        if (item.quantity == 0 && type == QuantityType.negative) return;
        item.quantity += numToAdd;
      }
    }
    _products.refresh();
    updateCart();
  }
}