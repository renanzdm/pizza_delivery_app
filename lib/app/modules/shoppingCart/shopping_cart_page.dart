import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/button_custom.dart';

import 'shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
        body: Column(
          children: [
            ListTile(
              title: Text('Nome'),
              subtitle: Text('Renan'),
            ),
            Divider(),
            Text('Pedidos'),
            Divider(),
            ListTile(
              title: Text('Endreco de entrega'),
              subtitle: Text('Rua XXXXX'),
              trailing: TextButton(
                onPressed: () {},
                child: Text('Alterar'),
              ),
            ),
            ListTile(
              title: Text('Forma de Pagamento'),
              subtitle: Text('Dinheiro'),
              trailing: TextButton(
                onPressed: () {},
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
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
