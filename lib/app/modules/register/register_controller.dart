import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:pizza_delivery_app/app/repositories/user_repository.dart';
import 'package:pizza_delivery_app/app/view_models/register_user_input_model.dart';

class RegisterController extends GetxController
    with Loadermixin, MessagesMixin {
  RegisterController(this._repository);
  final UserRepository _repository;
  final _obscureTextPassword = true.obs;
  final _obscureTextConfirmPassword = true.obs;
  final _loading = false.obs;
  final _message = Rx<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListerner(_loading);
    messageListener(_message);
  }

  bool get obscureTextPassword => _obscureTextPassword.value;
  bool get obscureTextConfirmPassword => _obscureTextConfirmPassword.value;

  void showHidePassword() => _obscureTextPassword.toggle();
  void showHideConfirmPassword() => _obscureTextConfirmPassword.toggle();

  Future<void> registerUser(String name, String email, String password) async {
    try {
      _loading.value = true;
      _message.value = null;
      final inputModel =
          RegisterUserInputModel(name: name, email: email, password: password);
      await _repository.registerUser(inputModel);
      _loading.value = false;
      _message.value = MessageModel(
        'Sucesso',
        'Usuario cadastrado com sucesso',
        MessageType.info,
      );
      await 2.seconds.delay();
      Get.close(2);
    } on RestClientException catch (e) {
      print(e.message);
      _loading.value = false;
      _message.value = MessageModel('Erro', e.message, MessageType.error);
    } catch (e) {
      print(e);

      _loading.value = false;
      _message.value =
          MessageModel('Erro', 'Erro ao registrar usuario', MessageType.error);
    }
  }
}
