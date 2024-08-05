import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:coloropacityapp/model/products.models.dart';
import 'package:http/http.dart' as http;

class ProductRepositiry {
  Future<List<ProductsModel>> fectchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((e) {
          return ProductsModel(
            id: e['id'],
            title: e['title'] as String,
            price: (e['price'] as num).toDouble(),
            description: e['description'] as String,
            category: e['category'] as String,
            image: e['image'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception("Wrong Url");
    } on TimeoutException {
      throw Exception("Time Out");
    }
    throw Exception("Something went Wrong");
  }
}
