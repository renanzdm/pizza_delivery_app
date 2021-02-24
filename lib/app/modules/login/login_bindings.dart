import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/modules/login/login_controller.dart';
import 'package:pizza_delivery_app/app/repositories/user_repository.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}
