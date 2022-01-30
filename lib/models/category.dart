import 'dart:convert';
  // To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

  List<String> categoryModelsFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  String categoryModelsToJson(List<String> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x)));
      
class CategoryModel {

}
