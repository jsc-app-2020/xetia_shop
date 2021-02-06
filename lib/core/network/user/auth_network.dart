import 'dart:io';

import 'package:http/http.dart';
import 'package:xetia_shop/core/model/user/auth_response.dart';
import 'package:xetia_shop/core/model/user/user_data.dart';
import 'package:xetia_shop/core/model/user/user_image.dart';

// untuk edit user
Future<AuthResponse> updateUser(String userId, String firstName,
    String lastName, String email, String phone, String address) async {
  Response res = await put(
      "https://02jsc2020-eval-test.apigee.net/user?id=34d36328-1de7-4e3c-8c68-1e265bcd7a7d",
      body: {
        "first_name": "rendi update",
        "last_name": "kurniasandii",
        "email": "rendi@gmail.com",
        "mobile_phone": "4444",
        "address": "Isekai"
      });

  AuthResponse decode = authResponseFromJson(res.body);
  if (res.statusCode == 200) {
    return decode;
  } else {
    throw Exception("failed to Update User");
  }
}

// untuk hapus user
Future<AuthResponse> deleteUser(String userId) async {
  Response res =
      await delete("https://02jsc2020-eval-test.apigee.net/user?id=$userId");

  AuthResponse decode = authResponseFromJson(res.body);
  if (res.statusCode == 200) {
    return decode;
  } else {
    throw Exception("Failed Delete User");
  }
}

// untuk menambahkan user
Future<AuthResponse> addUser(
    String firstName,
    String lastName,
    String password,
    String email,
    String phone,
    String address,
    int role,
    String entity,
    bool superUser,
    bool staf) async {
  Response res =
      await post("https://02jsc2020-eval-test.apigee.net/user", body: {
    "first_name": "rendi",
    "last_name": "",
    "password": "rendi1234",
    "email": "rendi@gmail.com",
    "mobile_phone": "4444",
    "address": "Isekai",
    "role": "1",
    "entity": "ea4462bf-d784-44a7-9bfd-7b1ef8b9d798",
    "is_superuser": true,
    "is_staff": false
  });

  AuthResponse decode = authResponseFromJson(res.body);
  if (res.statusCode == 200) {
    return decode;
  } else {
    throw Exception("Failed add user");
  }
}

// menambahkan user
Future<UserData> userData({String userId}) async {
  Response res = await get("https://02jsc2020-eval-test.apigee.net/user?id=");

  UserData decode = userDataFromJson(res.body);
  if (res.statusCode == 200) {
    return decode;
  } else {
    throw Exception("Failed Get userdata");
  }
}

// logout user
Future<AuthResponse> logout(String accessT, String refreshT) async {
  Response res = await post("http://02jsc2020-eval-prod.apigee.net/user/logout",
      headers: {"Authorization": "Bearer $accessT"},
      body: {"refresh_token": refreshT});
  if (res.statusCode == 205) {
    return AuthResponse(meta: MetaRes(code: 205, message: "Success"));
  } else {
    return AuthResponse(meta: MetaRes(code: 500, message: "Token Expired"));
  }
}

Future<UserImage> getUserImage({String token, File image}) async {
  Response res =
      await get("http://35.224.69.69:8085/api/v1/user/image-profile", headers: {
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEyMDEzOTE0LCJqdGkiOiI2YjFhMzYwYzhlZWM0OGY4OTU3MWJmZTY1MzZmNTFlMiIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.7fUhODXh53blXXiCzcfGijonI_RuT7SHrTIw8OVOgDQ"
  });

  if (res.statusCode == 200) {
    UserImage decode = userImageFromJson(res.body);

    print(decode.meta.message);
    return decode;
  } else {
    throw Exception("Failed for get data");
  }
}

Future<UserImage> postUserImage({String token, File image}) async {
  Response res = await post(
      "http://35.224.69.69:8085/api/v1/user/image-profile",
      headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEyMDEzOTE0LCJqdGkiOiI2YjFhMzYwYzhlZWM0OGY4OTU3MWJmZTY1MzZmNTFlMiIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.7fUhODXh53blXXiCzcfGijonI_RuT7SHrTIw8OVOgDQ"
      },
      body: {
        "imagefile":
            "https://i.pinimg.com/originals/29/47/9b/29479ba0435741580ca9f4a467be6207.png"
      });

  if (res.statusCode == 200) {
    UserImage decode = userImageFromJson(res.body);

    print(decode.meta.message);
    return decode;
  } else {
    throw Exception("Failed for get data");
  }
}
