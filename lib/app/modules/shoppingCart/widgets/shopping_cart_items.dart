import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../shopping_cart_controller.dart';
import 'shopping_cart_item_row.dart';

class ShoppingCartItems extends GetView<ShoppingCartController> {
  final numberFormat =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Pedidos',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ...controller.flavorsSelected
            .map((item) => ShoppingCartItemRow(item))
            .toList(),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text(numberFormat.format(controller.totalPrice))
            ],
          ),
        )
      ],
    );
  }
}
