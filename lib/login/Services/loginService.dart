import 'dart:convert' as convert;
import 'package:cookingapp/constants.dart';
import 'package:cookingapp/main.dart';
import 'package:cookingapp/models/provinecs.dart';
import 'package:cookingapp/models/user.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      final dataOut = {'token': data['access_token'], 'user': data['user_type']};
      return dataOut;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future register({
    String? user_type,
    String? first_name,
    String? last_name,
    String? phone_number,
    String? birth_date,
    String? gender,
    String? username,
    String? password,
    String? password_confirmation,
    String? name,
    String? address,
    int? province_id,
    int? district_id,
    int? subdistrict_id,
    double? latitude,
    double? longitude,
  }) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final domain = prefs.getString('domain');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, 'api/auth/register');
    final response = await http.post(
      url,
      headers: headers,
      body: convert.jsonEncode({
        'user_type': user_type,
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'birth_date': birth_date,
        'gender': gender,
        'username': username,
        'password': password,
        'password_confirmation': password_confirmation,
        'name': name,
        'address': address,
        'province_id': province_id,
        'district_id': district_id,
        'subdistrict_id': subdistrict_id,
        'latitude': latitude,
        'longitude': longitude,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
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

  static Future<User> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, 'api/auth/me');
    final response = await http.post(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      final res = await Dio().get(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&language=th&key=$kGoogleApiKey',
      );
      final List results = res.data['results'];
      if (results.isNotEmpty) {
        return results[0]['formatted_address'];
      } else {
        return 'ไม่พบข้อมูล';
      }
    } on DioException catch (e) {
      Future.error(e.message ?? '');
      rethrow;
    }
  }
}
