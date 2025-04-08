import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_anchor.dart';

class CustomSearchController extends TextEditingController {
  CustomSearchBarAnchorState? _anchor;
  set anchor(CustomSearchBarAnchorState anchor) => _anchor = anchor;
}
