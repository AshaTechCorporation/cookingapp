import 'package:cookingapp/constants.dart';
import 'package:cookingapp/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  const HomeApi();

  //เรียกดูข้อมูล Restaurant
  static Future<List<Restaurant>> getRestaurants() async {
    final url = Uri.https(publicUrl, '/api/restaurant/show');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล Restaurant By Id
  static Future<Restaurant> getRestaurant({required int id}) async {
    final url = Uri.https(publicUrl, '/api/restaurant/showID/$id');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return Restaurant.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

}