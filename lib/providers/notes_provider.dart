import 'package:flutter/cupertino.dart';
import 'package:intern7/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void editNote(NoteModel note) {
    final noteIndex = _notes.indexWhere((element) => element.id == note.id);
    _notes[noteIndex] = note;
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    _notes.remove(note);
    notifyListeners();
  }
}
