import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/button_custom.dart';
import 'package:pizza_delivery_app/app/components/text_form_field_custom.dart';
import 'package:pizza_delivery_app/app/modules/register/register_page.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (_, constrainsts) {
          return SizedBox(
            width: constrainsts.maxWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormFieldCustom(
                            controller: emailController,
                            label: 'Email',
                            validator: (String value) {
                              if (value == null ||
                                  value.isBlank ||
                                  !value.isEmail) {
                                return 'Email invalido';
                              }
                              return null;
                            },
                          ),
                          Obx(() {
                            return TextFormFieldCustom(
                              controller: passwordController,
                              label: 'Senha',
                              validator: (String value) {
                                if (value.length < 6) {
                                  return 'Senha deve conter no minimo 6 caracters';
                                }
                                return null;
                              },
                              suffixIcon: Icon(
                                FontAwesome.key,
                              ),
                              obscureText: controller.obscureText,
                              suffixIconOnPressed: controller.showHidePassword,
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonCustom(
                              height: 50,
                              width: constrainsts.maxWidth * .8,
                              buttonColor: Theme.of(context).primaryColor,
                              label: 'Login',
                              labelColor: Colors.white,
                              labelSize: 20,
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  controller.login(emailController.text,
                                      passwordController.text);
                                }
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RegisterPage.ROUTE_PAGE);
                            },
                            child: Text(
                              'Cadastre-se',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
