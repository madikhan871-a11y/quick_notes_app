import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/storage_service.dart';
import '../widgets/note_card.dart';
import '../widgets/empty_widget.dart';
import 'add_note_screen.dart';
import 'edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final storage = Provider.of<StorageService>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Quick Notes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),


      body: storage.notes.isEmpty

          ? const EmptyWidget()

          : ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: storage.notes.length,

        itemBuilder: (context,index){

          final note = storage.notes[index];

          return NoteCard(
            note: note,

            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      EditNoteScreen(note: note),
                ),
              );
            },

            onDelete: (){
              storage.deleteNote(note.id);
            },
          );
        },
      ),



      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),

        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
              const AddNoteScreen(),
            ),
          );

        },

      ),

    );
  }
}