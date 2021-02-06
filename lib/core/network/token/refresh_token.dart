import 'package:http/http.dart' as http;
import 'package:xetia_shop/core/model/token/acces_token_model.dart';

Future<AccessTokenModel> refreshToken(String token) async {
  http.Response res = await http.post(
      "https://02jsc2020-eval-test.apigee.net/user/login/refresh",
      body: {"refresh": token});

  AccessTokenModel decode = accessTokenModelFromJson(res.body);

  if (res.statusCode == 200) {
    return decode;
  } else {
    return null;
  }
}
