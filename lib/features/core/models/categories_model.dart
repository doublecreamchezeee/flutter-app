import 'dart:convert';

class CategoriesModel{
  final String name;

  CategoriesModel({
    required this.name
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(name: json['name'],);
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
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