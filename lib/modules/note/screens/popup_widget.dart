import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/helper/size.dart';
import 'package:seiornote/modules/note/providers/note_provider.dart';

class PopUpWidget extends StatelessWidget {
  final Note note;

  const PopUpWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              children: [
                const Icon(Icons.favorite_outline),
                SizedBox(width: kDefaultPadding.right),
                Text((!context.read<NoteProvider>().isFavorite)
                    ? LanguageKey.addToFavorite.tr()
                    : LanguageKey.removeFromFavorite.tr()),
              ],
            ),
            onTap: () {
              context.read<NoteProvider>().isFavorite = !context.read<NoteProvider>().isFavorite;
            },
          ),
          PopupMenuItem(
            child: Row(
              children: [
                const Icon(Icons.close),
                SizedBox(width: kDefaultPadding.right),
                Text(LanguageKey.cancel.tr()),
              ],
            ),
          ),
        ];
      },
    );
  }
}
