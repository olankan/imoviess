import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}
