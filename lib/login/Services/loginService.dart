import 'dart:convert' as convert;
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/models/districts.dart';
import 'package:cookingapp/models/provinecs.dart';
import 'package:http/http.dart' as http;

class LoginService {
  const LoginService();

  static Future login(
    String username,
    String password,
  ) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final domain = prefs.getString('domain');
    final url = Uri.https(publicUrl, 'api/auth/login');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['accessToken'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future register({
    String? first_name,
    String? last_name,
    int? phone_number,
    String? birth_date,
    String? gender,
    String? username,
    String? password,
    String? password_confirmation,
    String? name,
    String? address,
  }) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final domain = prefs.getString('domain');
    final url = Uri.https(publicUrl, 'api/auth/register');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['accessToken'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<Provinecs>> getProvinecs(
      // {required int baranchid}
      ) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/provinces/show', {
      // "branchId": "$baranchid",
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data as List;
      return list.map((e) => Provinecs.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<Provinecs>> getDistrits({required int id}) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, 'api/provinces/filter/$id', {
      // "branchId": "$baranchid",
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Provinecs.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<Provinecs>> getSubDistrits({required int id}) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, 'api/districts/filter/$id', {
      // "branchId": "$baranchid",
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Provinecs.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
