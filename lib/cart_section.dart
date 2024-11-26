import 'package:demo/cart.dart';
import 'package:demo/item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cartsection extends StatefulWidget {
  const Cartsection({super.key});

  @override
  State<Cartsection> createState() => _CartsectionState();
}

class _CartsectionState extends State<Cartsection> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = Cart().items;
    if (items.isEmpty) {
      return const Center(
          child: Text(
        "Your cart is Empty!",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));
    } else {
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            Item item = items[index];
            return Card(
              child: ListTile(
                onTap: () {
                  setState(() {
                    Cart().removeItem(index);
                    Fluttertoast.showToast(
                        msg: "Product removed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${item.image}'),
                ),
                title: Text(item.name),
                trailing: Text("${item.price.toStringAsFixed(2)} €"),
              ),
            );
          });
    }
  }
}
