import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_delivery_app/app/models/menu_item_model.dart';
import 'package:pizza_delivery_app/app/models/menu_model.dart';
import 'package:pizza_delivery_app/app/modules/shoppingCart/shopping_cart_controller.dart';
import 'package:pizza_delivery_app/app/modules/shoppingCart/shopping_cart_page.dart';
import 'package:pizza_delivery_app/app/repositories/menu_repository.dart';

class MenuController extends GetxController {
  MenuController(this._repository);

  final MenuRepository _repository;
  final _menu = <MenuModel>[].obs;
  final _flavorsSelected = <MenuItemModel>[].obs;

  List<MenuModel> get menu => _menu;
  List<MenuItemModel> get flavorsSelected => _flavorsSelected;
  double get totalValue =>
      _flavorsSelected.fold(0, (value, item) => value += item.price);

  @override
  Future<void> onInit() async {
    super.onInit();
    final menuData = await _repository.findAll();
    _menu.assignAll(menuData);
  }

  void addItem(MenuItemModel item) {
    if (_flavorsSelected.contains(item)) {
      _flavorsSelected.remove(item);
    } else {
      _flavorsSelected.add(item);
    }
  }

  Future<void> goToShoppingCart() async {
    Get.put(ShoppingCartController());
    await showBarModalBottomSheet(
      isDismissible: false,
      context: Get.context,
      builder: (_) {
        return ShoppingCartPage();
      },
    );
    Get.delete<ShoppingCartController>();
  }
}
