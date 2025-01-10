import 'package:labib/controller/chat_page_co.dart';
import 'package:labib/core/constant/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class DesingMessage extends GetView<ChatPageCoIm> {
  final String type;
  final String message;
  final String nameUser;
  final String nameBot;
  final String imageUser;
  final String imageBot;
  final int index;
  const DesingMessage(
      {super.key,
      required this.type,
      required this.message,
      required this.imageUser,
      required this.imageBot,
      required this.nameUser,
      required this.nameBot,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GetX<ChatPageCoIm>(builder: (co) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: co.width / 10, vertical: 8),
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _icon(),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                _message(co),
                type == 'user'
                    ? const SizedBox()
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _copyIcon(() => co.copytext(message)),
                        ],
                      )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _icon() {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircleAvatar(
        backgroundImage: AssetImage(type == 'user' ? imageUser : imageBot),
      ),
    );
  }

  Widget _title() {
    return Text(
      type == 'user' ? nameUser : nameBot,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsApp.black,
      ),
    );
  }

  Widget _message(ChatPageCoIm co) {
    return SizedBox(
        width: (co.width.value - ((co.width.value / 10) * 2)) - 39,
        child: MarkdownBody(
          data: message,
          onTapLink: (text, href, title) {
            co.openurl(href);
          },
        ));
  }

  Widget _copyIcon(void Function()? onPressed) {
    return SizedBox(
      height: 20,
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(
            UIcons.regularRounded.copy,
            size: 18,
            color: const Color(0xff999999),
          )),
    );
  }
}
