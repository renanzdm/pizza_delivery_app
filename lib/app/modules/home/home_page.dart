import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/bottom_navigation.dart';
import 'package:pizza_delivery_app/app/modules/home/widgets/home_header.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  static const String ROUTE_PAGE = '/home';
  static const int NAVIGATION_BAR_INDEX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      bottomNavigationBar: BottomNavigationCustom(NAVIGATION_BAR_INDEX),
      body: LayoutBuilder(builder: (_, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        child: Text(
                          'Pizzas',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        width: constraints.maxWidth,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            onTap: () {
                              controller.openMenu('Grande');
                            },
                            title: Text('Grande',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        width: constraints.maxWidth,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            onTap: () {
                              controller.openMenu('Brotos');
                            },
                            title: Text(
                              'Brotos',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
