import 'package:flutter_application_1/models/product.dart';
import 'package:http/http.dart' as http;
//import 'package:shopx/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Products>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?product_type=eyebrow'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}