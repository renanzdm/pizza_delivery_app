import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pizza_delivery_app/app/models/order_model.dart';

class HistoryPannel extends StatelessWidget {
  final OrderModel orderModel;
  HistoryPannel(
    this.orderModel,
  );
  final formatNumber =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Pedido ${orderModel.id}'),
      children: [
        ...orderModel.items.map(
          (e) => Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.item.name),
                Text('R\$ ${formatNumber.format(e.item.price)}'),
              ],
            ),
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text('R\$ ${formatNumber.format(_calculateTotalOrder())}'),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  double _calculateTotalOrder() {
    return orderModel.items.fold(0, (total, item) => total += item.item.price);
  }
}
