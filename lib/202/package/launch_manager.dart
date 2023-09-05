import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse("https://www.eloopsakademi.com");
mixin LaunchMixin {
  Future<void> launchUrL() async {
    if (!await launchUrl(_url)) throw "Siteye ulaşılmıyor  $_url";
  }
}
