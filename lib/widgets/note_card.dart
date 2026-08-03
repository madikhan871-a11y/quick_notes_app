import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteCard extends StatelessWidget {

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;


  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
  });


  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 4,

      margin: const EdgeInsets.only(bottom:15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),


      child: ListTile(

        contentPadding:
        const EdgeInsets.all(15),


        title: Text(
          note.title,
          style: const TextStyle(
            fontSize:18,
            fontWeight:FontWeight.bold,
          ),
        ),


        subtitle: Padding(

          padding:
          const EdgeInsets.only(top:8),

          child: Text(
            note.content,
            maxLines:3,
            overflow:TextOverflow.ellipsis,
          ),
        ),


        onTap: onTap,


        trailing: IconButton(

          icon: const Icon(
            Icons.delete,
            color:Colors.red,
          ),

          onPressed: onDelete,

        ),

      ),
    );
  }
}