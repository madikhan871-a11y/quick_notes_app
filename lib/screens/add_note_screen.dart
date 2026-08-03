import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/note_model.dart';
import '../services/storage_service.dart';
import '../widgets/custom_button.dart';


class AddNoteScreen extends StatefulWidget {

  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();

}


class _AddNoteScreenState extends State<AddNoteScreen> {


  final titleController = TextEditingController();
  final contentController = TextEditingController();



  void saveNote(){

    if(titleController.text.trim().isEmpty ||
        contentController.text.trim().isEmpty){

      return;
    }


    final note = Note(

      id: const Uuid().v4(),

      title: titleController.text.trim(),

      content: contentController.text.trim(),

      createdAt: DateTime.now(),

    );


    Provider.of<StorageService>(
      context,
      listen:false,
    ).addNote(note);


    Navigator.pop(context);

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Note"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            TextField(

              controller:titleController,

              decoration: InputDecoration(

                labelText:"Title",

                border:OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(12),

                ),
              ),
            ),


            const SizedBox(height:20),


            TextField(

              controller:contentController,

              maxLines:6,

              decoration: InputDecoration(

                labelText:"Note",

                border:OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(12),

                ),
              ),
            ),


            const SizedBox(height:30),


            CustomButton(

              text:"Save Note",

              onPressed:saveNote,

            )

          ],
        ),
      ),
    );
  }
}