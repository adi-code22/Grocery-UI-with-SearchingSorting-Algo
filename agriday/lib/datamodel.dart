import 'package:flutter/material.dart';

class Fruit {
  String? seller;
  String? product;
  String? variety;
  int? price;
  int? avgweight;
  int? perbox;
  int? boxes;
  String? delivery;
  Fruit(
      {this.seller,
      this.product,
      this.variety,
      this.price,
      this.avgweight,
      this.perbox,
      this.boxes,
      this.delivery});

  Fruit.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    product = json['Product'];
    variety = json['Variety'];
    price = json['Price'];
    avgweight = json['AvgWeight'];
    perbox = json['PerBox'];
    boxes = json['Boxes'];
    delivery = json['Delivery'];
  }
}
