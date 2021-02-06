// To parse this JSON data, do
//
//     final subscription = subscriptionFromJson(jsonString);

import 'dart:convert';

Subscription subscriptionFromJson(String str) =>
    Subscription.fromJson(json.decode(str));

String subscriptionToJson(Subscription data) => json.encode(data.toJson());

class Subscription {
  Subscription({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.userId,
    this.subscriptions,
  });

  String userId;
  List<SubscriptionElement> subscriptions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        subscriptions: List<SubscriptionElement>.from(
            json["subscriptions"].map((x) => SubscriptionElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "subscriptions":
            List<dynamic>.from(subscriptions.map((x) => x.toJson())),
      };
}

class SubscriptionElement {
  SubscriptionElement({
    this.subscriptionId,
    this.createdAt,
    this.expiredAt,
    this.maxRequests,
    this.currentRequests,
    this.token,
  });

  String subscriptionId;
  String createdAt;
  String expiredAt;
  int maxRequests;
  int currentRequests;
  String token;

  factory SubscriptionElement.fromJson(Map<String, dynamic> json) =>
      SubscriptionElement(
        subscriptionId: json["subscription_id"],
        createdAt: json["created_at"],
        expiredAt: json["expired_at"],
        maxRequests: json["max_requests"],
        currentRequests: json["current_requests"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "subscription_id": subscriptionId,
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
