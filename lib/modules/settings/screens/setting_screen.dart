import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seiornote/helper/color.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/helper/locale.dart';
import 'package:seiornote/modules/settings/screens/language_option_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Widget bodyWidget(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.language_outlined),
          title: Text(LanguageKey.languages).tr(),
          trailing: Text(LocaleUtils.toCountryName(context.locale.languageCode)),
          onTap: () async {
            showDialog(
              context: context,
              builder: (context) {
                return const LanguageOptionWidget();
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.color_lens_outlined),
          title: Text(LanguageKey.colorAccent).tr(),
          trailing: Text(kPrimaryColor.value.toString()),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: kPrimaryColor,
                content: const Text('Comming soon'),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outlined),
          title: Text(LanguageKey.about).tr(),
          trailing: Text(LanguageKey.aboutMe).tr(),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: kPrimaryColor,
                content: const Text('Comming soon'),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(LanguageKey.setting).tr(),
      ),
      body: bodyWidget(context),
    );
  }
}
