import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:mvvm/utils/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.blueberry10, body: Column(children: [SizedBox(height: 50), CustomSearchBar()]));
  }
}
