import 'package:demo/item.dart';

class Catalog {
  static final List<Item> catalog = [
    Item(id: "-1", name: "NOT FOUND", price: 0, image: "notfound.jpg"),
    Item(id: "80000532", name: "Acqua Levissima", price: 0.3, image: "water.jpg"),
    Item(id: "8002410001815", name: "Deodorante Neutro Roberts", price: 3, image: "deodorant.jpg"),
    Item(id: "5449000000453", name: "Coca Cola", price: 0.7, image: "cocacola.jpg")
  ];

  static Item findItemById(String id) {
    return catalog.firstWhere(
      (item) => item.id == id,
      orElse: () => catalog[0],
    );
  }
}
