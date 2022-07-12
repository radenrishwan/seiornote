import 'package:seiornote/database/models/note.dart';

abstract class NoteRepository {
  List<Note> findAll();
  List<Note> findByTag(String tag);
  List<Note> findByFavorite();
  Note insert(Note note);
  void delete(String id);
  Note update(Note note);
}
