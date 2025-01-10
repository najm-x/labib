import 'package:labib/core/constant/app_pages.dart';
import 'package:labib/core/locallzition/language.dart';
import 'package:labib/core/locallzition/language_co.dart';
import 'package:labib/core/services/myservices.dart';
import 'package:labib/theme/app_theme.dart';
import 'package:labib/view/screen/chatpage.dart';
import 'package:labib/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screen/chose_languge.dart';

void main() async {
  await startServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LanguageCoIm languageCoIm = Get.put(LanguageCoIm());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "8".tr,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      translations: Language(),
      locale: languageCoIm.lang,
      initialRoute: AppPages.init,
      getPages: [
        GetPage(name: AppPages.init, page: () => SplashScreen()),
        GetPage(
            name: AppPages.chatPage,
            page: () => Chatpage(),
            transition: Transition.size,
            transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
            name: AppPages.splashScreen,
            page: () => const ChoseLanguge(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 500)),
      ],
    );
  }
}
/* 

*/ 
