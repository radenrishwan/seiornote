import 'package:flutter/material.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/database/repository/impl/note_repository_impl.dart';
import 'package:seiornote/database/repository/note_repository.dart';

class NoteProvider extends ChangeNotifier {
  final NoteRepository noteRepository = NoteRepositoryImpl();
  bool isFavorite = false;

  Future<void> createNote(Note note) async {
    noteRepository.insert(note);
  }

  Future<void> editNote(Note note) async {
    noteRepository.update(note);
  }

  Future<void> deleteNote(String id) async {
    noteRepository.delete(id);
  }
}
