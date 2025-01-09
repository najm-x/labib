import 'dart:async';
import 'package:labib/core/constant/links_app.dart';
import 'package:labib/core/function/note_dialog.dart';
import 'package:labib/data/data_source/static/prompts.dart';
import 'package:labib/data/data_source/static/static_strings.dart';
import 'package:labib/data/model/message_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class labibPageCo extends GetxController {
  shownote();
  sendDataMessageGemini(String message);
  onsend(String message, String typebot);
  onSendData();
  onGetData(String val);
  onGetDataError(String val);
  gotohome();
  openurl(String urll);
  copytext(String text);
 
}

class ChatPageCoIm extends labibPageCo {
  String typeBot = 'gemini';
  bool isStart = true;
  RxBool iscopy = false.obs;
  RxDouble width = 0.0.obs;
  late TextEditingController textcntorol;
  double widthApp = Get.width;
  List<MessageModel> massege = [];
  bool send = true;
  bool wait = false;
  double maxScrollExtent = 0.0;
  String question = '';
  final ScrollController scrollController = ScrollController();
  
  
  final getstorage = GetStorage() ;
final RegExp regExp = RegExp(r'(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])') ;

  ///////// assistantsTools ////// api

late LinksApp linksApp;

// gemini 
late final GenerativeModel _model;
late final ChatSession _labib;

 String geminiKey = 'yor api key' ;

@override
void onInit() {
  linksApp = LinksApp();
  textcntorol = TextEditingController();
  shownote();
  super.onInit();
  // gemini
  _model = GenerativeModel(
    systemInstruction: Content.text(dataai),
    generationConfig: GenerationConfig(temperature: 0.9, topK: 1, topP: 1.0, maxOutputTokens: 1000),
    model: 'gemini-1.5-flash-latest',
    apiKey: geminiKey.replaceAll(RegExp(r'atc5BejYufSdxDRw'), "atc5B0jYuDSgnDRw"),
  );
  _labib = _model.startChat(history: StaticData.patrslabib);
}

@override
void shownote() {
  Timer(const Duration(seconds: 2), () {
    noteDialog();
  });
}

  

  @override
  sendDataMessageGemini(String message) async{
    onSendData();
    try {
     var respons = await _labib.sendMessage(Content.text("$message : قم بالرد على السؤال من النموذج المرفق")) ;
     onGetData(respons.text) ;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()) ;
      }
      onGetDataError(e.toString()) ;
    }
  }

  @override
  gotohome() {
    Get.offAllNamed('/');
  }

  @override
  Future<void> openurl(String urll) async {
    Uri url = Uri.parse(urll);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  copytext(String text) {
    FlutterClipboard.copy(text).then((value) {
      Get.snackbar('31'.tr, "30".tr);
    });
  }

  @override
  onsend(message, typebot) async {
   sendDataMessageGemini(message);
  }

  @override
  onGetData(String? val) async {
    if (kDebugMode) {
      print(val);
    }
    massege.add(MessageModel(nameSender: "bot", message: val.toString()));

   _scrollDown() ;
    update();
    wait = false;
    send = true;
    textcntorol.clear();
    update();
  }

  @override
  onSendData() {
    question.isNotEmpty ? massege.add(MessageModel(nameSender: 'user', message: question)) : null;
    wait = true;
    send = false;
    isStart = false;
    update();
  }

  @override
  onGetDataError(String val) {
    wait = false;
    send = true;
    Get.snackbar(
      'Erorr',
      "try agian",
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