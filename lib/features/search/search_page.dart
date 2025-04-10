import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_anchor.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_suggestions.dart';
import 'package:mvvm/core/widgets/custom_search_bar/search_bar_suggestion.dart';
import 'package:mvvm/utils/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          CustomSearchBarAnchor(
            searchBar: CustomSearchBar(bgColor: AppColors.rambutan100),
            suggestions: CustomSearchBarSuggestions(
              suggestions: [
                SearchBarSuggestion(text: 'Suggestion 1'),
                SearchBarSuggestion(text: '456'),
                SearchBarSuggestion(text: '789'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
