import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar.success({super.key, required String text}) : super(content: Row(children: [Icon(Icons.check)]));
}
