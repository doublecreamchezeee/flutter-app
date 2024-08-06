import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/features/core/models/categories_model.dart';
import 'package:flutter_application_1/features/core/models/shoe_model.dart';
import 'package:http/http.dart' as http;
import 'package:supercharged/supercharged.dart';

class ApiService {
  static Future<List<ShoeModel>?> getProducts() async {
    try {
      var url = Uri.parse(baseUrl + productEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ShoeModel> _model = shoeListFromJson(response.body);
        return _model;
      } else {
        log('Failed to load products');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<List<ShoeModel>?> getProductsWithCategory(categoryName) async {
    try {
      var url = Uri.parse(baseUrl + productEndpoint + categoryName);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ShoeModel> _model = shoeListFromJson(response.body);
        return _model;
      } else {
        log('Failed to load products');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<List<CategoriesModel>?> getCategories() async {
    try {
      var url = Uri.parse(baseUrl + categoriesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CategoriesModel> _model = categoriesListFromJson(response.body);
        return _model;
      } else {
        log('Failed to load products');
      }
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  static Future<int?> getTotalQuantity(int productId) async {
    try {
      var url = Uri.parse('$baseUrl$productDetailQuantityEndpoint?product_id=$productId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        int quantity = response.body.parseJSON();
        return quantity;
      } else {
        log('Failed to load quantity');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<int?> getTotalQuantityBySize(int productId, int size) async {
    try {
      var url = Uri.parse('$baseUrl$productDetailQuantityEndpoint?product_id=$productId&size=$size');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        int quantity = response.body.parseJSON();
        return quantity;
      } else {
        log('Failed to load quantity with size');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }  
}
