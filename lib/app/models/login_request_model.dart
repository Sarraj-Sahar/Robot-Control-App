// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
