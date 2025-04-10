import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_controller.dart';
import 'package:mvvm/core/widgets/custom_search_bar/search_bar_suggestion.dart';

class CustomSearchBarSuggestions extends StatefulWidget {
  const CustomSearchBarSuggestions({super.key, required this.suggestions});

  static late CustomSearchController controller;
  final List<SearchBarSuggestion> suggestions;

  @override
  State<CustomSearchBarSuggestions> createState() => CustomSearchBarSuggestionsState();
}

class CustomSearchBarSuggestionsState extends State<CustomSearchBarSuggestions> {
  CustomSearchController? controller;

  @override
  void initState() {
    super.initState();
    controller = CustomSearchBarSuggestions.controller;
    controller?.suggestions = this;
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        CustomSearchController.unfocus[0] = false;
      },
      onTapOutside: (e) {
        CustomSearchController.unfocus[0] = true;
        controller?.requestClose();
      },
      child: Container(
        decoration: BoxDecoration(color: controller?.searchBar.widget.bgColor, borderRadius: getBorderRadius()),
        child: Material(
          color: Colors.transparent,
          borderRadius: getBorderRadius(),
          child: Column(mainAxisSize: MainAxisSize.min, children: widget.suggestions),
        ),
      ),
    );
  }

  BorderRadiusGeometry getBorderRadius() {
    double radius = controller?.searchBar.widget.borderRadius ?? 16;
    return BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius));
  }
}
