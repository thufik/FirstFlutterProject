import 'package:flutter/material.dart';

class AppConfig {
  final String appName;
  final String appLogo;
  final Color primaryColor;

  AppConfig({required this.appName, required this.appLogo, required this.primaryColor});
}

final AppConfig appConfig = AppConfig(
  appName: "My App",
  appLogo: "assets/images/app_logo.png",
  primaryColor: Colors.blue,
);
