import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:seiornote/helper/router.dart';
import 'package:seiornote/helper/theme.dart';

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouterName.initialRoute,
      routes: RouterUtils.routes,
      theme: kThemeDefault,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
