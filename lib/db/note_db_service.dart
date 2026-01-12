import 'package:hive_flutter/hive_flutter.dart';
import '../models/hive_note_model.dart';

class NoteDbService {
  static const String _boxName = 'country_notes';
  late Box<Note> _notesBox;

  Future<void> init() async {
    await Hive.initFlutter();

    // Register adapter if not already
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(NoteAdapter());
    }

    _notesBox = await Hive.openBox<Note>(_boxName);
  }

  List<Note> getAllNotes() {
    return _notesBox.values.toList();
  }

  Note? getNoteForCountry(String countryName) {
    try {
      return _notesBox.values.firstWhere(
        (note) => note.countryName == countryName,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveNote(String countryName, String content) async {
    final existingNote = getNoteForCountry(countryName);
    if (existingNote != null) {
      existingNote.content = content;
      await existingNote.save();
    } else {
      final note = Note(countryName: countryName, content: content);
      await _notesBox.add(note);
    }
  }

  Future<void> deleteNote(String countryName) async {
    final existingNote = getNoteForCountry(countryName);
    if (existingNote != null) {
      await existingNote.delete();
    }
  }
}
