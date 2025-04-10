import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_suggestions.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_controller.dart';

class SearchBarSuggestion extends StatefulWidget {
  const SearchBarSuggestion({
    super.key,
    this.cursor = SystemMouseCursors.basic,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
    this.icon,
    required this.text,
  });

  final SystemMouseCursor cursor;
  final EdgeInsetsGeometry padding;
  final double? height;
  final IconData? icon;
  final String text;

  @override
  State<SearchBarSuggestion> createState() => _SearchBarSuggestionState();
}

class _SearchBarSuggestionState extends State<SearchBarSuggestion> {
  CustomSearchController? controller;
  double height = 0;

  @override
  void initState() {
    super.initState();
    controller = CustomSearchBarSuggestions.controller;
    assert(controller != null);
    if (widget.height == null) {
      height = controller!.searchBar.widget.height;
    } else {
      height = widget.height!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller?.text = widget.text;
        controller?.close();
      },
      child: MouseRegion(
        cursor: widget.cursor,
        child: Container(
          height: height,
          padding: widget.padding,
          child: Row(
            children: [
              if (widget.icon != null)
                const MouseRegion(cursor: SystemMouseCursors.click, child: Icon(Icons.search, color: Colors.grey)),
              if (widget.icon != null) const SizedBox(width: 12),
              Text(widget.text, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
