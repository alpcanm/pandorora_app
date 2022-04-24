import 'package:url_launcher/url_launcher.dart';

class UrlLaucnherManager {
  static Future<bool> launcHttp(String url) async {
    final Uri _uri = Uri.parse(url);
    bool _value = await canLaunchUrl(_uri);
    if (_value && await launchUrl(_uri)) {
      return true;
    } else {
      return false;
    }
  }
}
