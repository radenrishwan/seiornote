import 'package:flutter/material.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/database/repository/impl/note_repository_impl.dart';
import 'package:seiornote/database/repository/note_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<Note> notes = [];
  final NoteRepository _noteRepository = NoteRepositoryImpl();

  Future<void> findAll() async {
    notes = _noteRepository.findAll();
  }

  void reloadNotes() {
    notes = _noteRepository.findAll();

    notifyListeners();
  }
}
