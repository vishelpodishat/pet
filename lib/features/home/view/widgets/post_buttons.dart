import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_button.dart';
import 'package:mvvm/utils/app_colors.dart';

class PostButtons extends StatelessWidget {
  const PostButtons({super.key, required this.onTapUrl, required this.onDelete});

  final Function()? onTapUrl;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(onTap: onTapUrl, backgroundColor: AppColors.watermelon70, text: 'URL'),
        CustomButton(onTap: onDelete, backgroundColor: AppColors.rambutan70, text: 'DELETE'),
      ],
    );
  }
}
