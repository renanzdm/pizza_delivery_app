import 'dart:convert';

import 'menu_item_model.dart';

class MenuModel {
  final int id;
  final String menu;
  final List<MenuItemModel> items;

  MenuModel({this.id, this.menu, this.items});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'menu': menu,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MenuModel(
      id: map['id'],
      menu: map['menu'],
      items: List<MenuItemModel>.from(
          map['items']?.map((x) => MenuItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source));
}
