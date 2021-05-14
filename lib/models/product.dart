import 'package:flutter/material.dart';

class Product {
  String id, title, price;
  DateTime createdAt, updatedAt;

  Product({
    this.id,
    @required this.title,
    @required this.price,
    this.createdAt,
    this.updatedAt,
  });
}
