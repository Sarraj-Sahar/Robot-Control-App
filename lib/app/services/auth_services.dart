import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class AuthServices {
  //this is static bcz login() is a static fct => static only works with static
  static String baseApi = ""; //HOME
  static var client = http.Client();

  static login(LoginRequestModel model) async {
    var response = await client.post(
      Uri.parse('$baseApi/auth/login/'),
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      var stringObject = response.body;
      var user = loginResponseModelFromJson(stringObject);
      return user;
    } else {
      var myjson = response.body;
      var jsonValue = json.decode(myjson);
      return jsonValue["detail"];
    }
  }
}
