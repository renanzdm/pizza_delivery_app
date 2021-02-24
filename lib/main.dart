import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/config/application_bindings..dart';
import 'package:pizza_delivery_app/app/config/ui_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      theme: UiConfig.appTheme,
      getPages: UiConfig.routes,
    );
  }
}
