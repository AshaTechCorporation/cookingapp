import 'dart:ffi';

import 'package:cookingapp/constants.dart';
import 'package:cookingapp/extension/ApiExeption.dart';
import 'package:cookingapp/models/menus.dart';
import 'package:cookingapp/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<List<Menus>> getManus({required double lat, required double long}) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/menu/show', {'lat': '$lat', 'long': '$long'});
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Menus.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }
}
