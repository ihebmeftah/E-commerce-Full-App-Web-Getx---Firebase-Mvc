import 'package:ecommerceapp/models/category.dart';
import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception('Faile to load CategoryServices');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(String categoryname) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryname'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Faile to load AllCategoryServices');
    }
  }
}
