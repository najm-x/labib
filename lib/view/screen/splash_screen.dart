import 'package:labib/controller/splash_screen_co.dart';
import 'package:labib/core/constant/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labib/view/widget/logo_widget.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenCoIm splashScreenCoIm = Get.put(SplashScreenCoIm());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const LogoWidget(size: 100),
              const SizedBox(
                height: 10,
              ),
              _title(),
              const SizedBox(
                height: 4,
              ),
              _subTitle(),
              const Spacer(),
              _buttomText(),
            ],
          ),
        ));
  }

  Widget _title() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        '5'.tr,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, height: 0, color: ColorsApp.black),
      ),
    );
  }

  Widget _subTitle() {
    return Container(
      width: 154,
      alignment: Alignment.center,
      child: Text(
        '4'.tr,
        style: TextStyle(fontSize: 14, color: ColorsApp.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttomText() {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      alignment: Alignment.center,
      child: Text(
        '@2025-2026',
        style: TextStyle(
          fontSize: 12,
          color: ColorsApp.premary.withOpacity(0.5),
        ),
      ),
    );
  }
}
