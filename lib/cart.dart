import 'package:demo/catalog.dart';
import 'package:demo/item.dart';

class Cart {
  Cart._internal();
  static final Cart _instance = Cart._internal();
  factory Cart() {
    return _instance;
  }

  final List<Item> items = [];

  void addItem(String itemId) {
    final item = Catalog.findItemById(itemId);
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  double getTotalPrice() {
    return items.fold(0.0, (total, item) => total + item.price);
  }
}
