import 'package:flutter/material.dart';
import 'package:mvvm/utils/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.backgroundColor, required this.text});

  final Function()? onTap;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(4)),
      child: GestureDetector(onTap: onTap, child: Text(text, style: AppFont.bodyHuge20)),
    );
  }
}
