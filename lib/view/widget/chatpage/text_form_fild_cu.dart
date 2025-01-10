import 'package:labib/controller/chat_page_co.dart';
import 'package:labib/core/constant/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFildCu extends GetView<ChatPageCoIm> {
  const TextFormFildCu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
          cursorColor: ColorsApp.gradientdown,
          maxLines: 3,
          minLines: 1,
          controller: controller.textcntorol,
          decoration: InputDecoration(
              hintText: '8'.tr,
              hintStyle: const TextStyle(fontSize: 14),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: ColorsApp.premary)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: ColorsApp.premary)),
              contentPadding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10)),
        ));
  }
}
