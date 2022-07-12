import 'package:hive/hive.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/database/repository/note_repository.dart';
import 'package:uuid/uuid.dart';

class NoteRepositoryImpl extends NoteRepository {
  late Box<Note> _box;
  static String boxName = 'note';

  static final NoteRepositoryImpl _instance = NoteRepositoryImpl._internal();

  factory NoteRepositoryImpl() {
    return _instance;
  }

  NoteRepositoryImpl._internal() {
    _box = Hive.box<Note>('note');
  }

  @override
  void delete(String id) {
    _box.delete(id);
  }

  @override
  List<Note> findAll() {
    final result = _box.values.toList();

    result.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return result;
  }

  @override
  List<Note> findByFavorite() {
    // TODO: implement findByFavorite
    throw UnimplementedError();
  }

  @override
  List<Note> findByTag(String tag) {
    // TODO: implement findByTag
    throw UnimplementedError();
  }

  @override
  Note insert(Note note) {
    final id = const Uuid().v4();

    note.id = id;
    _box.put(id, note);

    return note;
  }

  @override
  Note update(Note note) {
    _box.put(note.id, note);

    return note;
  }
}
