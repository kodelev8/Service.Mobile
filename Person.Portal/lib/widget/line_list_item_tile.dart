import 'package:flutter/material.dart';

Widget LineListTile(String? title, String? text, [bool threeLine = true]) {
  return ListTile(
    isThreeLine: threeLine,
    title: Text(title ?? ''),
    subtitle: Text(text ?? ''),
  );
}