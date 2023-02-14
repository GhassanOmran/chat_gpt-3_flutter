import 'package:flutter/material.dart';

Widget TextFieldWithSubmit(
    {required TextEditingController textEditingController,
    required Function() function}) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: textEditingController,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Enter message',
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      IconButton(
        icon: const Icon(Icons.send),
        onPressed: function,
      ),
    ],
  );
}
