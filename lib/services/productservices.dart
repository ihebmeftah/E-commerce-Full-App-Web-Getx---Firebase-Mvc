import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Faile to load product');
    }
  }
}
