import 'dart:developer';
import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/features/core/models/categories_model.dart';
import 'package:flutter_application_1/features/core/models/shoe_model.dart';
import 'package:http/http.dart' as http;

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
}
