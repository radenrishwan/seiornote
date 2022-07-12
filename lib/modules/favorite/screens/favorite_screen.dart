import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/modules/favorite/providers/favorite_provider.dart';
import 'package:seiornote/modules/home/providers/home_provider.dart';
import 'package:seiornote/modules/note/providers/note_provider.dart';
import 'package:seiornote/widgets/empty_widget.dart';
import 'package:seiornote/widgets/loading_widget.dart';
import 'package:seiornote/widgets/note_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  Widget bodyWidget(BuildContext context) {
    return FutureBuilder<void>(
      future: context.read<FavoriteProvider>().findAllFavorite(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }

        return Consumer<FavoriteProvider>(
          builder: (context, value, child) {
            if (value.favoriteNotes.isEmpty) {
              return const EmptyWidget();
            }

            return ListView.builder(
              itemCount: value.favoriteNotes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: value.favoriteNotes[index],
                  onDeleteTap: () {
                    context.read<NoteProvider>().deleteNote(value.favoriteNotes[index].id ?? '');
                    context.read<HomeProvider>().reloadNotes();
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(LanguageKey.favoriteTitle.tr()),
      ),
      body: bodyWidget(context),
    );
  }
}
