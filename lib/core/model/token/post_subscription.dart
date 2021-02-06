// To parse this JSON data, do
//
//     final postSubscription = postSubscriptionFromJson(jsonString);

import 'dart:convert';

PostSubscription postSubscriptionFromJson(String str) =>
    PostSubscription.fromJson(json.decode(str));

String postSubscriptionToJson(PostSubscription data) =>
    json.encode(data.toJson());

class PostSubscription {
  PostSubscription({
    this.meta,
    this.data,
  });

  Meta meta;
  Data data;

  factory PostSubscription.fromJson(Map<String, dynamic> json) =>
      PostSubscription(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.subscriptionId,
    this.userId,
    this.createdAt,
    this.expiredAt,
    this.maxRequests,
    this.currentRequests,
    this.token,
  });

  String subscriptionId;
  String userId;
  String createdAt;
  String expiredAt;
  int maxRequests;
  int currentRequests;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subscriptionId: json["subscription_id"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        expiredAt: json["expired_at"],
        maxRequests: json["max_requests"],
        currentRequests: json["current_requests"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "subscription_id": subscriptionId,
        "user_id": userId,
        "created_at": createdAt,
        "expired_at": expiredAt,
        "max_requests": maxRequests,
        "current_requests": currentRequests,
        "token": token,
      };
}

class Meta {
  Meta({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
