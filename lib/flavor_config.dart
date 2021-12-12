import 'package:flutter/material.dart';

enum Endpoints { tokoApi }

class FlavorConfig {
  String? appTitle;
  Map<Endpoints, String>? apiEndpoint;
  FlavorConfig();
}