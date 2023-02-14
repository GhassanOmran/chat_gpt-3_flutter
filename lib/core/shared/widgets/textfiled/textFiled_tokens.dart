import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTokensTextfield({
  int? maxlength,
  required TextEditingController textEditingController,
}) {
  return SizedBox(
    width: 120,

    ///Here
    child: TextField(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: maxlength ?? 4,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      controller: textEditingController,
    ),
  );
  //   ],
  // );
}
