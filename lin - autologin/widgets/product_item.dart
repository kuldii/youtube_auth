import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../pages/edit_product_page.dart';

class ProductItem extends StatelessWidget {
  final String id, title, price;

  final DateTime updatedAt;

  ProductItem(this.id, this.title, this.price, this.updatedAt);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Products>(context, listen: false);
    String date = DateFormat.yMMMd().add_Hms().format(updatedAt);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, EditProductPage.route, arguments: id);
      },
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FittedBox(
            child: Text("\$$price"),
          ),
        ),
      ),
      title: Text("$title"),
      subtitle: Text("Last Edited : $date"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          prov.deleteProduct(id);
        },
      ),
    );
  }
}
