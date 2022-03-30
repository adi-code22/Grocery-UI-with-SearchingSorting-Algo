import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

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

  Future<List<Fruit>> getPeople() async {
    final jsondata = await rootBundle.rootBundle.loadString('lib/Fruits.json');
    final list = json.decode(jsondata) as List<dynamic>;
    final length = list.length;
    return list.map((e) => Fruit.fromJson(e)).toList();
  }
}
