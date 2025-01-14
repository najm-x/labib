
  import 'package:url_launcher/url_launcher.dart';

Future<void> openurl(String? urll) async {
    if (urll != null) {
      Uri url = Uri.parse(urll);
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }
  }