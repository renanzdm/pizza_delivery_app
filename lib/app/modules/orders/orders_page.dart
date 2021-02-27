import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/bottom_navigation.dart';
import 'package:pizza_delivery_app/app/models/order_model.dart';
import 'package:pizza_delivery_app/app/modules/orders/widgets/history_pannel.dart';

import 'orders_controller.dart';

class OrdersPage extends GetView<OrdersController> {
  static const String ROUTE_PAGE = '/orders';
  static const int NAVIGATION_BAR_INDEX = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationCustom(NAVIGATION_BAR_INDEX),
      appBar: AppBar(
        title: Text('OrdersPage'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.findOrders();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  child: controller.obx(
                    (orders) {
                      return _makeOrder(orders);
                    },
                    onError: (_) {
                      return Center(
                        child: Text('Erro ao buscar pedidos'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Visibility _makeOrder(List<OrderModel> orders) {
    print(orders.length);
    return Visibility(
        visible: orders.length != 0,
        replacement: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Nenhum pedido',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              orders.length,
              (index) => HistoryPannel(
                orders[index],
              ),
            ),
          ),
        ));
  }
}
