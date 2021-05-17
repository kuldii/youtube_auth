import 'package:flutter/material.dart';

class Product {
  String id, title, price;
  DateTime createdAt, updatedAt;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.createdAt,
    this.updatedAt,
  });
}
