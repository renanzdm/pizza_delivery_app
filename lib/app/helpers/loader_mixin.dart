import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin Loadermixin on GetxController {
  void loaderListerner(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
            Center(
              child: CircularProgressIndicator(),
            ),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }
}
