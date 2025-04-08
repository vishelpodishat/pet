import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_controller.dart';

class CustomSearchBarAnchor extends StatefulWidget {
  const CustomSearchBarAnchor({super.key, this.controller, required this.searchBar});

  final CustomSearchController? controller;
  final CustomSearchBar searchBar;

  @override
  State<CustomSearchBarAnchor> createState() => CustomSearchBarAnchorState();
}

class CustomSearchBarAnchorState extends State<CustomSearchBarAnchor> {
  late final CustomSearchController controller;
  final layerLink = LayerLink();
  OverlayEntry? entry;

  bool get isOpen => entry != null;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = CustomSearchController();
    }
    controller.anchor = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
