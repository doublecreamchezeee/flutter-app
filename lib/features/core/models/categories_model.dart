import 'dart:convert';

class CategoriesModel{
  final String name;
  final String id;

  CategoriesModel({
    required this.name,
    required this.id
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(name: json['name'],id: json['id']);
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'id': id
    };
  }
}

List<CategoriesModel> categoriesListFromJson(String str){
  final jsonData = json.decode(str) as List<dynamic>;
  return jsonData.map((item) => CategoriesModel.fromJson(item)).toList();
}

String categoriesListToJson(List<CategoriesModel> data){
  final jsonData = data.map((item) => item.toJson()).toList();
  return json.encode(jsonData);
}