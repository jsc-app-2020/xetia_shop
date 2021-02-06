import 'package:http/http.dart';
import 'package:xetia_shop/core/model/token/post_subscription.dart';
import 'package:xetia_shop/core/model/token/subscription.dart';

Future<String> subcriptionToken(String userId) async {
  Response res = await post(
      'https://02jsc2020-eval-prod.apigee.net/subscription',
      body: {"user_id": userId, "max_requests": "100000", "days": "10000"});

  PostSubscription decode = postSubscriptionFromJson(res.body);
  if (res.statusCode == 201) {
    return decode.data.token;
  } else {
    throw Exception("Load Token Failed");
  }
}

Future<String> getSubscription(String userId) async {
  Response res = await get(
      "https://02jsc2020-eval-prod.apigee.net/subscription?user_id=$userId");

  Subscription decode = subscriptionFromJson(res.body);

  if (res.statusCode == 200) {
    // mengecek apakah data kosong atau tidak
    if (decode.data.isNotEmpty) {
      // mengecek token apakah sudah expired atau belum
      for (var i = 0; i < decode.data[0].subscriptions.length; i++) {
        if (decode.data[0].subscriptions[i].currentRequests >=
            decode.data[0].subscriptions[i].maxRequests) {
          // kalo token sudah melebihi limit/expired POST token baru
          return await subcriptionToken(userId);
        }
        // kalo belum gunakan token yg lama
        return decode.data[0].subscriptions[i].token;
      }
    } else {
      // kalo kosong ambil POST token
      return await subcriptionToken(userId);
    }
  } else if (res.statusCode == 404) {
    //kalo userId belum mendapatkan token maka return null
    return await subcriptionToken(userId);
  } else {
    throw Exception("Failed get subscription");
  }
}
