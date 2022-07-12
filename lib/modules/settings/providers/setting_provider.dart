import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:restart_app/restart_app.dart';
import 'package:seiornote/helper/router.dart';

class SettingProvider extends ChangeNotifier {
  String selectedLanguage = 'en';

  Future<void> changeLanguage(BuildContext context, String languageCode) async {
    await context.setLocale(Locale(languageCode));
    Restart.restartApp(webOrigin: RouterName.settingNote);
  }
}
