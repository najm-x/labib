import 'package:labib/core/constant/image_assets.dart';
import 'package:labib/core/constant/links_app.dart';
import 'package:labib/data/model/social_model.dart';
import 'package:labib/data/model/start_items_model.dart';
import 'package:get/get.dart';

class StaticData {
  static List<SocialModel> socialModel = [
    SocialModel(image: ImageAssets.call, url: LinksApp.whatsapp),
    SocialModel(image: ImageAssets.github, url: LinksApp.github),
    SocialModel(image: ImageAssets.linkedin, url: LinksApp.linkedin),
  ];
  static List<StartItemsModel> startItemsModel = [
    StartItemsModel(title: '19'.tr, body: '20'.tr),
    StartItemsModel(title: '21'.tr, body: '22'.tr),
    StartItemsModel(title: '23'.tr, body: '24'.tr),
    StartItemsModel(title: '25'.tr, body: '26'.tr),
  ];
  StaticData() {
    startItemsModel = [
      StartItemsModel(title: '19'.tr, body: '20'.tr),
      StartItemsModel(title: '21'.tr, body: '22'.tr),
      StartItemsModel(title: '23'.tr, body: '24'.tr),
      StartItemsModel(title: '25'.tr, body: '26'.tr),
    ];
  }
}
