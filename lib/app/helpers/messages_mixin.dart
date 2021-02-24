import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rx<MessageModel> message) {
    ever<MessageModel>(message, (model) async {
      if (model != null) {
        Get.snackbar(model.title, model.message,
            backgroundColor: model.messaType.color());
      } else {}
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType messaType;

  MessageModel(this.title, this.message, this.messaType);
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red.shade800;
        break;
      case MessageType.info:
        return Colors.blue.shade200;
        break;
      default:
        return Colors.orangeAccent;
        return Colors.black38;
    }
  }
}
