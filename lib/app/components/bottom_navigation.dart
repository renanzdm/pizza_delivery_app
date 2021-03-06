import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/modules/home/home_page.dart';
import 'package:pizza_delivery_app/app/modules/orders/orders_page.dart';
import 'package:pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationCustom extends StatelessWidget {
  final int _currentIndex;

  const BottomNavigationCustom(this._currentIndex);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          label: 'home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
            label: 'Pedidos',
            icon: Icon(
              Icons.menu,
            )),
        BottomNavigationBarItem(
          label: 'Sair',
          icon: Icon(FontAwesome.sign_out),
        ),
      ],
      onTap: (index) async {
        switch (index) {
          case 0:
            Get.offAllNamed(HomePage.ROUTE_PAGE);
            break;
          case 1:
            Get.offAllNamed(OrdersPage.ROUTE_PAGE);
            break;
          case 2:
            final sp = await SharedPreferences.getInstance();
            sp.clear();
            Get.offAllNamed(SplashPage.ROUTE_PAGE);
            break;
        }
      },
    );
  }
}
