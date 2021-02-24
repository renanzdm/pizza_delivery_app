import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/helpers/rest_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
