import 'package:flutter/cupertino.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/database/repository/impl/note_repository_impl.dart';
import 'package:seiornote/database/repository/note_repository.dart';

class FavoriteProvider extends ChangeNotifier {
  final NoteRepository noteRepository = NoteRepositoryImpl();
  List<Note> favoriteNotes = [];

  Future<void> findAllFavorite() async {
    final dump = noteRepository.findAll();

    favoriteNotes = dump.where((element) => element.isFavorite == true).toList();
  }
}
