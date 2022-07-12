import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/modules/settings/providers/setting_provider.dart';

class LanguageOptionWidget extends StatelessWidget {
  const LanguageOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Select Language'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: const Text('English'),
            onPressed: () {
              context.read<SettingProvider>().selectedLanguage = 'en';
            },
          ),
          TextButton(
            child: const Text('Bahasa Indonesia'),
            onPressed: () {
              context.read<SettingProvider>().selectedLanguage = 'id';
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LanguageKey.cancel).tr(),
        ),
        TextButton(
          onPressed: () {
            context.read<SettingProvider>().changeLanguage(
                  context,
                  context.read<SettingProvider>().selectedLanguage,
                );
          },
          child: const Text('Ok').tr(),
        ),
      ],
    );
  }
}
