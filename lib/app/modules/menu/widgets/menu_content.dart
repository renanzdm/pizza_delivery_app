import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/modules/menu/menu_controller.dart';

import 'menu_group.dart';

class MenuContent extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (_, index) => MenuGroup(controller.menu[index]),
        ),
      ),
    );
  }
}
