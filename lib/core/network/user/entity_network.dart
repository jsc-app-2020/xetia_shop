import 'package:http/http.dart';
import 'package:xetia_shop/core/model/user/entity_response.dart';

Future getEntity() async {
  Response res = await get("http://35.224.69.69:8085/api/v1/entity");

  if (res.statusCode == 200) {
    EntityResponse decode = entityResponseFromJson(res.body);

    print(decode.meta.message);
  } else {
    throw Exception("Failed for get data");
  }
}
