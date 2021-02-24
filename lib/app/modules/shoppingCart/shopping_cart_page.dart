import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/button_custom.dart';

import 'shopping_cart_controller.dart';
import 'widgets/shopping_cart_items.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar'),
            ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            'Sacola',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: LayoutBuilder(builder: (_, constraints) {
          return SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nome'),
                    subtitle: Text(controller.username),
                  ),
                  Divider(),
                  ShoppingCartItems(),
                  Divider(),
                  ListTile(
                    title: Text('Endreco de entrega'),
                    subtitle: Obx(() => Text(controller.address)),
                    trailing: TextButton(
                      onPressed: () => controller.changeAddress(),
                      child: Text('Alterar'),
                    ),
                  ),
                  ListTile(
                    title: Text('Forma de Pagamento'),
                    subtitle: Obx(() => Text(controller.paymentType)),
                    trailing: TextButton(
                      onPressed: () => controller.changePaymentType(),
                      child: Text('Alterar'),
                    ),
                  ),
                  Divider(),
                  Spacer(),
                  ButtonCustom(
                    label: 'Finalizar Pedido',
                    width: Get.mediaQuery.size.width * .9,
                    height: 50,
                    buttonColor: Get.theme.primaryColor,
                    labelColor: Colors.white,
                    labelSize: 18,
                    onPressed: () => controller.checkout(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
