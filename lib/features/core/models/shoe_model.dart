import 'package:flutter/material.dart';
import 'dart:convert';

Color hexToColor(String hexString) {
  final hexCode = hexString.replaceAll('#', '');
  final colorInt = int.parse(hexCode, radix: 16);
  
  // If no alpha channel, assume full opacity (0xFF)
  return Color(colorInt | 0xFF000000);
}

class ShoeModel {
  final int id;
  final String brand;
  final String model;
  final double price;
  final String imgAddress;
  final Color modelColor;

  ShoeModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.imgAddress,
    required this.modelColor,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      price: json['price'],
      imgAddress: json['imageUrl'],
      modelColor: hexToColor(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
