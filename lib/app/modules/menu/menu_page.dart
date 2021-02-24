import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:pizza_delivery_app/app/modules/menu/widgets/menu_buy_button.dart';

import 'widgets/menu_content.dart';

class MenuPage extends GetView<MenuController> {
  final String pizzaSize;

  MenuPage(this.pizzaSize);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        title: Text(
          pizzaSize,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.shade200,
              width: double.infinity,
              child: Obx(
                () {
                  return Text(
                    'Toatal de pizzas selecionadas: ${controller.flavorsSelected.length}',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
            Expanded(
              child: MenuContent(),
            ),
            Container(
              child: MenuBuyButton(),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
