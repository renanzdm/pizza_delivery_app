import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/modules/orders/orders_controller.dart';
import 'package:pizza_delivery_app/app/repositories/order_repository.dart';

class OrdersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderRepository(Get.find()));
    Get.put(OrdersController(Get.find()));
  }
}
