import 'dart:async';
import 'package:labib/core/class/enum_states.dart';
import 'package:labib/core/function/note_dialog.dart';
import 'package:labib/data/model/message_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labib/data/remote/chat_remote.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ChatPageCo extends GetxController {
  void shownote();
  void handelingSend(String message);
  void onsend(String message);
  void onSendData(String message);
  void onGetData(MessageModel val);
  void onGetDataError(String val);
  void gotohome();
  void copytext(String text);
}

class ChatPageCoIm extends ChatPageCo {
  bool isStart = true;
  RxBool iscopy = false.obs;
  RxDouble width = 0.0.obs;
  late TextEditingController textcntorol;
  double widthApp = Get.width;
  List<MessageModel> massege = [];
  bool send = true;
  bool wait = false;
  final ScrollController scrollController = ScrollController();
  final ChatRemote chatRemote = ChatRemote();

  @override
  void onInit() {
    textcntorol = TextEditingController();
    shownote();
    super.onInit();
    // gemini
  }

  @override
  void shownote() {
    Timer(const Duration(seconds: 2), () {
      noteDialog();
    });
  }

  @override
  void handelingSend(String message) async {
    onSendData(message);
    try {
      var respons = await chatRemote.sendMessage(massege);
      if (respons is MessageModel) {
        onGetData(respons);
      } else {
        onGetDataError(respons == EnumStates.network
            ? "Check Your Internet"
            : respons == EnumStates.cost
                ? "تم تجاوز الحد المسموح الرجاء المحاولة لا حقا"
                : "error try agin");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      onGetDataError(e.toString());
    }
  }

  @override
  void gotohome() {
    Get.offAllNamed('/');
  }


  @override
  void copytext(String text) {
    FlutterClipboard.copy(text).then((value) {
      Get.snackbar('31'.tr, "30".tr);
    });
  }

  @override
  void onsend(message) async {
    handelingSend(message);
  }

  @override
  void onGetData(MessageModel val) async {
    if (kDebugMode) {
      print(val);
    }
    massege.add((val));

    _scrollDown();
    wait = false;
    send = true;
    textcntorol.clear();
    update();
  }

  @override
  void onSendData(String message) {
    massege.add(MessageModel(nameSender: 'user', message: message));
    wait = true;
    send = false;
    isStart = false;
    update();
  }

  @override
  void onGetDataError(String val) {
    wait = false;
    send = true;
    Get.snackbar(
      'Erorr',
      val,
    );
    textcntorol.clear();
    update();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }
}
