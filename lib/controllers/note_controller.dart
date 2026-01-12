import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../db/note_db_service.dart';

class NoteController extends GetxController {
  static NoteController get instance => Get.find();

  final NoteDbService _dbService = NoteDbService();

  final RxString noteContent = ''.obs;
  final RxBool hasNote = false.obs;
  final RxBool isEditing = false.obs;

  late String _currentCountry;

  late TextEditingController textController;

  @override
  void onInit() async {
    super.onInit();
    await _dbService.init();
    textController = TextEditingController();
  }

  void loadNoteForCountry(String countryName) {
    _currentCountry = countryName;
    final note = _dbService.getNoteForCountry(countryName);
    if (note != null) {
      noteContent.value = note.content;
      textController.text = note.content;
      hasNote.value = true;
      isEditing.value = false;
    } else {
      noteContent.value = '';
      textController.clear();
      hasNote.value = false;
      isEditing.value = false;
    }
  }

  void setEditing(bool value) {
    isEditing.value = value;
  }

  Future<void> saveNote() async {
    if (_currentCountry.isEmpty) return;

    await _dbService.saveNote(_currentCountry, textController.text);
    noteContent.value = textController.text;
    hasNote.value = true;
    isEditing.value = false;
  }

  Future<void> deleteNote() async {
    if (_currentCountry.isEmpty) return;

    await _dbService.deleteNote(_currentCountry);
    noteContent.value = '';
    textController.clear();
    hasNote.value = false;
    isEditing.value = false;
  }
}
