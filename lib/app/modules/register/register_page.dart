import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/components/button_custom.dart';
import 'package:pizza_delivery_app/app/components/text_form_field_custom.dart';

import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  static const String ROUTE_PAGE = '/register';
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                            controller: nameController,
                            label: 'Nome',
                            validator: (String value) {
                              if (value.isBlank) {
                                return 'Campo Origatorio';
                              }
                              return null;
                            },
                          ),
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
                              obscureText: controller.obscureTextPassword,
                              suffixIconOnPressed: controller.showHidePassword,
                            );
                          }),
                          Obx(() {
                            return TextFormFieldCustom(
                              controller: confirmPasswordController,
                              label: 'Confirmar Senha',
                              validator: (String value) {
                                if (value != passwordController.text) {
                                  return 'Senha e confrimar senha devem ser iguais ';
                                } else if (value.length < 6) {
                                  return 'Senha deve conter no minimo 6 caracters';
                                }
                                return null;
                              },
                              suffixIcon: Icon(
                                FontAwesome.key,
                              ),
                              obscureText:
                                  controller.obscureTextConfirmPassword,
                              suffixIconOnPressed:
                                  controller.showHideConfirmPassword,
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonCustom(
                              height: 50,
                              width: constrainsts.maxWidth * .8,
                              buttonColor: Theme.of(context).primaryColor,
                              label: 'Salvar',
                              labelColor: Colors.white,
                              labelSize: 20,
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  controller.registerUser(
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text);
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonCustom(
                            height: 50,
                            width: constrainsts.maxWidth * .8,
                            label: 'Voltar',
                            labelSize: 20,
                            onPressed: () => Get.back(),
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
