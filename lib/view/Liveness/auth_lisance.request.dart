// To parse this JSON data, do
//
//     final authLisanceRequest = authLisanceRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AuthLisanceRequest {
  AuthLisanceRequest({
    required this.licenseEffectiveSeconds,
    required this.applicationId,
  });

  int licenseEffectiveSeconds;
  String applicationId;

  factory AuthLisanceRequest.fromJson(Map<String, dynamic> json) => AuthLisanceRequest(
    licenseEffectiveSeconds: json["licenseEffectiveSeconds"] == null ? null : json["licenseEffectiveSeconds"],
    applicationId: json["applicationId"] == null ? null : json["applicationId"],
  );

  Map<String, dynamic> toJson() => {
    "licenseEffectiveSeconds": licenseEffectiveSeconds == null ? null : licenseEffectiveSeconds,
    "applicationId": applicationId == null ? null : applicationId,
  };
}
