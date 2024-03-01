import 'package:flutter/material.dart';
import 'package:new_flutter_project/RG-MA/config.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(appConfig.appLogo);
  }
}