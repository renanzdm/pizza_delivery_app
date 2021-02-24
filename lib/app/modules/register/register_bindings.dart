import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/repositories/user_repository.dart';

import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}
