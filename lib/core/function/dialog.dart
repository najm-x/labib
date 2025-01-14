import 'package:labib/core/constant/colors_app.dart';
import 'package:labib/core/function/open_url.dart';
import 'package:labib/data/static/static_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: ColorsApp.white,
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 5 , left: 10 , right: 10),    
            decoration: BoxDecoration(color: ColorsApp.greythree, borderRadius: BorderRadius.circular(6)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(color: ColorsApp.white, borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleDialog(str: '11'.tr),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "10".tr,
                        style: TextStyle(fontSize: 14, color: ColorsApp.black, fontFamily: 'fontm'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(color: ColorsApp.white, borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleDialog(str: '9'.tr),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ImageSocial(
                                image: StaticData.socialModel[index].image,
                                url: StaticData.socialModel[index].url,
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                                  width: 10,
                                ),
                            itemCount: StaticData.socialModel.length),
                      ),
                   
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                 ),

                   Center(child: OutlinedButton.icon(onPressed: ()=> openurl("https://labib-assistant.blogspot.com/p/privacy-policy.html"), label: const Text("privacy-policy")  , icon:const Icon( Icons.info) ,),)
              ],
            ),
          )
        ],
      );
    },
  );
}

class TitleDialog extends StatelessWidget {
  final String str;
  const TitleDialog({super.key, required this.str});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: 100,
            child: Divider(
              height: 1,
              color: ColorsApp.black,
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          color: ColorsApp.white,
          child: Text(
            str,
            style: TextStyle(fontSize: 14, color: ColorsApp.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class ImageSocial extends StatelessWidget {
  final String image;
  final String url;
  const ImageSocial({super.key, required this.image, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openurl(url),
      child: Image.asset(
        image,
        height: 35,
        width: 35,
      ),
    );
  }
}
