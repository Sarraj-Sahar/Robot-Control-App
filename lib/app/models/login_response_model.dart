// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.email,
    required this.username,
    required this.tokens,
  });

  String email;
  String username;
  Tokens tokens;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        email: json["email"],
        username: json["username"],
        tokens: Tokens.fromJson(json["tokens"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "tokens": tokens.toJson(),
      };
}

class Tokens {
  Tokens({
    this.refresh,
    required this.acces,
  });

  String? refresh;
  String acces;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        acces: json["acces"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "acces": acces,
      };
}
