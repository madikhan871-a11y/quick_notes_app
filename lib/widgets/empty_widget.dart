import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {

  const EmptyWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: const [

          Icon(
            Icons.note_alt_outlined,
            size: 80,
            color: Colors.red,
          ),

          SizedBox(height:20),

          Text(
            "No Notes Yet",
            style: TextStyle(
              fontSize:22,
              fontWeight:FontWeight.bold,
            ),
          ),

          SizedBox(height:8),

          Text(
            "Create your first note",
          ),

        ],
      ),
    );
  }
}