import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';
import '../services/storage_service.dart';
import '../widgets/custom_button.dart';


class EditNoteScreen extends StatefulWidget {


  final Note note;


  const EditNoteScreen({
    super.key,
    required this.note,
  });


  @override
  State<EditNoteScreen> createState() =>
      _EditNoteScreenState();

}



class _EditNoteScreenState extends State<EditNoteScreen>{


  late TextEditingController titleController;
  late TextEditingController contentController;



  @override
  void initState(){

    super.initState();

    titleController =
        TextEditingController(
          text: widget.note.title,
        );


    contentController =
        TextEditingController(
          text: widget.note.content,
        );

  }



  void updateNote(){


    final updated = Note(

      id: widget.note.id,

      title:titleController.text,

      content:contentController.text,

      createdAt:widget.note.createdAt,

    );


    Provider.of<StorageService>(
      context,
      listen:false,
    ).updateNote(updated);


    Navigator.pop(context);

  }



  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar:AppBar(
        title:const Text("Edit Note"),
      ),


      body:Padding(

        padding:const EdgeInsets.all(20),


        child:Column(

          children:[


            TextField(

              controller:titleController,

              decoration:const InputDecoration(
                labelText:"Title",
              ),
            ),


            const SizedBox(height:20),


            TextField(

              controller:contentController,

              maxLines:6,

              decoration:const InputDecoration(
                labelText:"Note",
              ),
            ),


            const SizedBox(height:30),


            CustomButton(

              text:"Update Note",

              onPressed:updateNote,

            )

          ],
        ),
      ),
    );
  }
}