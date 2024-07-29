import 'package:flutter/material.dart';
import 'dart:convert';

class ShoeModel {
  final String brand;
  final String model;
  final double price;
  final String imgAddress;
  final Color modelColor;

  ShoeModel({
    required this.brand,
    required this.model,
    required this.price,
    required this.imgAddress,
    required this.modelColor,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      brand: json['brand'],
      model: json['model'],
      price: json['price'],
      imgAddress: json['imageUrl'],
      modelColor: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'price': price,
      'imageUrl': imgAddress,
      'color': modelColor.value,
    };
  }
}

List<ShoeModel> shoeListFromJson(String str) {
  final jsonData = json.decode(str) as List<dynamic>;
  return jsonData.map((item) => ShoeModel.fromJson(item)).toList();
}

String shoeListToJson(List<ShoeModel> data) {
  final jsonData = data.map((item) => item.toJson()).toList();
  return json.encode(jsonData);
}
