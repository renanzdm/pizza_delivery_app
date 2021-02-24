import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:pizza_delivery_app/app/modules/home/home_page.dart';
import 'package:pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:pizza_delivery_app/app/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with Loadermixin, MessagesMixin {
  LoginController(this._repository);

  final UserRepository _repository;
  final _obscureText = true.obs;
  final loading = false.obs;
  final message = Rx<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListerner(loading);
    messageListener(message);
  }

  bool get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  Future<void> login(String email, String password) async {
    try {
      loading.value = true;
      message.value = null;
      final user = await _repository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('user', user.toJson());
      loading.value = false;
      Get.offAndToNamed(HomePage.ROUTE_PAGE);
    } on RestClientException catch (e) {
      print(e.message);
      loading.value = false;
      message.value = MessageModel('Erro', e.message, MessageType.error);
    } catch (e) {
      print(e);
      loading.value = false;
      message.value = MessageModel(
          'Erro', 'Erro ao autenticar usuario ', MessageType.error);
    }
  }
}
