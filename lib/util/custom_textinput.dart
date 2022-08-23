import 'package:flutter/material.dart';

Widget customTI(TextEditingController txc, String hinttext) {
  return TextField(
    controller: txc,
    decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.purple.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        )),
  );
}
