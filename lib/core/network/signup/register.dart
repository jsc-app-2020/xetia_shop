import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/core/model/signup/register_model.dart';

Future register(
    String first, String last, String email, String password) async {
  http.Response res = await http
      .post("https://02jsc2020-eval-prod.apigee.net/register", body: {
    "first_name": first,
    "last_name": last,
    "email": email,
    "password": password
  });

  final decode = RegisterModel.fromJson(jsonDecode(res.body));

  if (res.statusCode == 200) {
    return decode;
  } else if (res.statusCode == 500) {
    return decode;
  } else {
    return throw Exception("failed to get data");
  }
}
