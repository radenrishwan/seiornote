import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seiornote/helper/color.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/helper/router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text(
                'Seior Note.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(LanguageKey.home.tr()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: Text(LanguageKey.favorite.tr()),
            onTap: () {
              Navigator.pushNamed(context, RouterName.favorite);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(LanguageKey.setting.tr()),
            onTap: () {
              Navigator.pushNamed(context, RouterName.settingNote);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(LanguageKey.exit.tr()),
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
