import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pizza_delivery_app/app/modules/menu/menu_controller.dart';

class MenuBuyButton extends GetView<MenuController> {
  final formatter = NumberFormat('###.00', 'pt_br');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Row(
        children: [
          SizedBox(
            width: Get.mediaQuery.size.width * .5,
            child: Obx(() {
              return Text(
                controller.totalValue == 0.0
                    ? 'Total R\$ 0,00'
                    : 'Total R\$ ${formatter.format(controller.totalValue)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: controller.flavorsSelected.isEmpty
                        ? Colors.grey
                        : Colors.black),
              );
            }),
          ),
          Expanded(child: Obx(() {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    controller.flavorsSelected.isEmpty
                        ? Colors.grey[300]
                        : Colors.red),
              ),
              onPressed: controller.flavorsSelected.isEmpty
                  ? null
                  : () => controller.goToShoppingCart(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fechar pedido',
                  style: TextStyle(
                      fontSize: 18,
                      color: controller.flavorsSelected.isEmpty
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
