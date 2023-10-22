import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/data/model/product.dart';

class FastApi {
  Future<List<Map<String, dynamic>>> getRecommendation(Product product) async {
    String name = product.productName!;

    final response = await http
        .get(Uri.parse('http://localhost:8000/third/dot_product/$name/5'));

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      List<Map<String, dynamic>> data = List.from(responseData);
      listNet.clear();
      for (var element in data) {
        listNet.add(Product(
          productId: 0,
          productName: element['word'],
          departmentId: product.departmentId,
          aisleId: product.aisleId,
          price: Random().nextInt(20) + 10.toDouble(),
          quantity: 0,
        ));
      }
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List> GetUserRecommendation() async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/fourth/get_recommendations/50'));
    final responseAsjson = json.decode(response.body);
    List userRecommendation = responseAsjson['recommendations'];
    userRecommendationList.clear();
    for (var element in userRecommendation) {
      userRecommendationList.add(
        Product(
            aisleId: 0,
            departmentId: 0,
            productName: element['product_name'],
            price: Random().nextInt(20) + 10.toDouble(),
            quantity: 0),
      );
    }
    return userRecommendationList;
  }
}
