import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pizza_delivery_app/app/models/menu_model.dart';
import 'package:pizza_delivery_app/app/modules/menu/menu_controller.dart';

class MenuGroup extends GetView<MenuController> {
  final formatter = NumberFormat('###.00', 'pt_br');
  final MenuModel _menu;

  MenuGroup(this._menu);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            _menu.menu,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _menu.items.length,
            itemBuilder: (_, index) {
              final item = _menu.items[index];
              return ListTile(
                title: Text(
                  item.name ?? "",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                subtitle: Text(
                  "R\$ ${formatter.format(item.price)}" ?? "",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Obx(
                  () {
                    final itemSelected =
                        controller.flavorsSelected.contains(item);
                    return IconButton(
                      icon: Icon(
                        itemSelected
                            ? FontAwesome.minus_square
                            : FontAwesome.plus_square,
                        size: 20,
                        color: Colors.red,
                      ),
                      onPressed: () => controller.addItem(item),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
