// To parse this JSON data, do
//
//     final authLisanceResponse = authLisanceResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AuthLisanceResponse {
  AuthLisanceResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.extra,
    required this.transactionId,
    required this.pricingStrategy,
  });

  String code;
  String message;
  AuthLisanceResponseData? data;
  dynamic extra;
  String transactionId;
  String pricingStrategy;

  factory AuthLisanceResponse.fromJson(Map<String, dynamic> json) => AuthLisanceResponse(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : AuthLisanceResponseData.fromJson(json["data"]),
    extra: json["extra"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    pricingStrategy: json["pricingStrategy"] == null ? null : json["pricingStrategy"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "data": data == null ? null : data?.toJson(),
    "extra": extra,
    "transactionId": transactionId == null ? null : transactionId,
    "pricingStrategy": pricingStrategy == null ? null : pricingStrategy,
  };
}

class AuthLisanceResponseData {
  AuthLisanceResponseData({
    required this.license,
    required this.expireTimestamp,
  });

  String license;
  int expireTimestamp;

  factory AuthLisanceResponseData.fromJson(Map<String, dynamic> json) => AuthLisanceResponseData(
    license: json["license"] == null ? null : json["license"],
    expireTimestamp: json["expireTimestamp"] == null ? null : json["expireTimestamp"],
  );

  Map<String, dynamic> toJson() => {
    "license": license == null ? null : license,
    "expireTimestamp": expireTimestamp == null ? null : expireTimestamp,
  };
}
