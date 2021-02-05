import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/core/model/signin/sign_in_response.dart';

Future<SignInResponse> signInRequest(String email, String password) async {
  print("response : ${jsonEncode(<String, String>{
    "username": email,
    "password": password
  })}");

  final http.Response response = await http.post(
      "https://02jsc2020-eval-test.apigee.net/user/login",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}));
  return SignInResponse.fromJson(jsonDecode(response.body));
}
