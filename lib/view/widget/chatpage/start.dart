import 'package:labib/controller/chat_page_co.dart';
import 'package:labib/core/class/responsave_layout.dart';
import 'package:labib/view/widget/chatpage/start_items_responsive/descktop_start_chose.dart';
import 'package:labib/view/widget/chatpage/start_items_responsive/phone_start_chose.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labib/view/widget/logo_widget.dart';

class Start extends GetView<ChatPageCoIm> {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 4,
          ),
          const LogoWidget(size: 100),
          const SizedBox(
            height: 10,
          ),
          _title(context),
          const Spacer(
            flex: 4,
          ),
          const ResponsaveLayout(phone: PhoneStartChose(), decktop: DescktopStartChose()),
          const Spacer()
        ],
      ),
    );
  }
  Widget _title(BuildContext context){
     return Text(
            '18'.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          );
  }
}
