import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_anchor.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_suggestions.dart';

class CustomSearchController extends TextEditingController {
  CustomSearchBarAnchorState? _anchor;
  set anchor(CustomSearchBarAnchorState anchor) => _anchor = anchor;

  CustomSearchBarState? _searchBar;
  CustomSearchBarState get searchBar => _searchBar!;
  set searchBar(CustomSearchBarState searchBar) => _searchBar = searchBar;

  CustomSearchBarSuggestionsState? _suggestions;
  CustomSearchBarSuggestionsState get suggestions => _suggestions!;
  set suggestions(CustomSearchBarSuggestionsState suggestions) => _suggestions = suggestions;

  bool get isOpen => _anchor?.isOpen ?? false;

  static final List<bool> unfocus = [false, false];

  void open() {
    _anchor?.open();
  }

  void requestClose() {
    if (unfocus[0] && unfocus[1]) {
      close();
      unfocus[0] = false;
      unfocus[1] = false;
    }
  }

  void close() {
    _anchor?.close();

    // ignore: invalid_use_of_protected_member
    _searchBar?.setState(() {});
  }

  @override
  void clear() {
    super.clear();
    _anchor?.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _anchor?.close();
  }
}
