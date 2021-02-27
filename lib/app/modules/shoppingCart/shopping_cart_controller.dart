import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:pizza_delivery_app/app/models/menu_item_model.dart';
import 'package:pizza_delivery_app/app/models/user_model.dart';
import 'package:pizza_delivery_app/app/repositories/order_repository.dart';
import 'package:pizza_delivery_app/app/view_models/checkout_input_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartController extends GetxController
    with MessagesMixin, Loadermixin {
  ShoppingCartController(this.flavorsSelected, this._repository);
  final OrderRepository _repository;
  final RxList<MenuItemModel> flavorsSelected;
  final _user = Rx<UserModel>();
  final _address = ''.obs;
  final _paymentType = ''.obs;
  final addressEditingController = TextEditingController();
  final _message = Rx<MessageModel>();
  final _loading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    messageListener(_message);
    loaderListerner(_loading);
    final sp = await SharedPreferences.getInstance();
    _user.value = UserModel.fromJson(sp.getString('user'));
  }

  double get totalPrice =>
      flavorsSelected.fold(0, (total, item) => total += item.price);

  String get username => _user.value?.name ?? '';
  String get address => _address.value ?? '';
  String get paymentType => _paymentType.value ?? '';

  Future<void> changeAddress() async {
    await Get.defaultDialog(
      barrierDismissible: false,
      title: 'Endereco de entrega',
      content: TextField(
        controller: addressEditingController,
      ),
      cancel: RaisedButton(
        onPressed: () {
          Get.back();
        },
        color: Get.theme.primaryColor,
        child: Text('Cancelar'),
        textColor: Colors.white,
      ),
      confirm: RaisedButton(
        onPressed: () {
          _address.value = addressEditingController.text;
          addressEditingController.clear();
          Get.back();
        },
        color: Get.theme.primaryColor,
        child: Text('Alterar'),
        textColor: Colors.white,
      ),
    );
  }

  Future<void> changePaymentType() async {
    await Get.defaultDialog(
      barrierDismissible: false,
      title: 'Forma de pagamento',
      content: Container(
        child: RadioButtonGroup(
          labels: [
            'Cartao de Credito',
            'Cartao de Debito',
            'Dinheiro',
          ],
          onSelected: (String value) => _paymentType.value = value,
        ),
      ),
      cancel: RaisedButton(
        onPressed: () {
          Get.back();
        },
        color: Get.theme.primaryColor,
        child: Text('Cancelar'),
        textColor: Colors.white,
      ),
      confirm: RaisedButton(
        onPressed: () {
          Get.back();
        },
        color: Get.theme.primaryColor,
        child: Text('Alterar'),
        textColor: Colors.white,
      ),
    );
  }

  Future<void> checkout() async {
    if (address.isBlank) {
      _message.value = MessageModel(
          'Erro', 'Endreco de entrega obrigatorio', MessageType.error);
    } else if (paymentType.isBlank) {
      _message.value = MessageModel(
          'Erro', 'Forma de pagamento obrigatorio', MessageType.error);
    } else {
      _loading.value = true;
      await _repository.saverOrders(
        CheckoutInputModel(
          userId: _user.value.id,
          address: address,
          paymentType: paymentType,
          itemsId: flavorsSelected.map<int>((element) => element.id).toList(),
        ),
      );
      try {
        _loading.value = false;
        _message.value = MessageModel(
            'Sucesso', 'Pedido Realizado com Sucesso', MessageType.info);
        await 1.seconds.delay();
        Get.close(3);
      } catch (e) {
        print(e.toString());
        _loading.value = false;

        _message.value =
            MessageModel('Erro', 'Forma ao fazer pedido', MessageType.error);
      }
    }
  }
}
