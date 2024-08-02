import 'dart:convert';
import 'package:flutter_zip_reader/models/productModel.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductDetail(int id) async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return Product.fromJson(jsonData);
    } else {
      throw Exception('Failed to load product detail');
    }
  }
}
