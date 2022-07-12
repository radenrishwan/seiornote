import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:seiornote/helper/languages.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO : add image
      child: Text(LanguageKey.emptyNote).tr(),
    );
  }
}
