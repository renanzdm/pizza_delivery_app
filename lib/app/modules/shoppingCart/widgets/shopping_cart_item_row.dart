import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_delivery_app/app/models/menu_item_model.dart';

class ShoppingCartItemRow extends StatelessWidget {
  ShoppingCartItemRow(this.model);
  final MenuItemModel model;
  final numberFormat =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.name),
          Text(
            numberFormat.format(model.price),
          ),
        ],
      ),
    );
  }
}
