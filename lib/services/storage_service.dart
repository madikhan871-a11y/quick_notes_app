import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_model.dart';

class StorageService extends ChangeNotifier {
  late SharedPreferences _prefs;

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    loadNotes();
  }

  void loadNotes() {
    final data = _prefs.getString("notes");

    if (data != null) {
      final List decoded = jsonDecode(data);

      _notes = decoded
          .map((e) => Note.fromJson(e))
          .toList();
    }

    notifyListeners();
  }


  Future<void> saveNotes() async {
    final data = _notes
        .map((note) => note.toJson())
        .toList();

    await _prefs.setString(
      "notes",
      jsonEncode(data),
    );
  }


  Future<void> addNote(Note note) async {
    _notes.insert(0, note);

    await saveNotes();

    notifyListeners();
  }


  Future<void> updateNote(Note updatedNote) async {
    final index = _notes.indexWhere(
          (note) => note.id == updatedNote.id,
    );

    if (index != -1) {
      _notes[index] = updatedNote;
    }

    await saveNotes();

    notifyListeners();
  }


  Future<void> deleteNote(String id) async {
    _notes.removeWhere(
          (note) => note.id == id,
    );

    await saveNotes();

    notifyListeners();
  }
}