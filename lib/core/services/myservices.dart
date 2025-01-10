import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:labib/data/static/prompts.dart';

class MyServices extends GetxService {
  Future<MyServices> init() async {
    await GetStorage.init();
    String prompt = await _prompt();
    await GetStorage().write("prompt", prompt);
    return this;
  }

  Future<String> _prompt() async {
    var response = await http
        .get(Uri.parse("https://raw.githubusercontent.com/najm-flutter/archive_SE/refs/heads/master/prompt.txt"));
        debugPrint(response.body) ;
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return GetStorage().read("prompt") ?? dataai;
    }
  }
}

startServices() async {
  await Get.putAsync(() => MyServices().init());
}
