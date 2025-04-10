import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_suggestions.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_controller.dart';

class CustomSearchBarAnchor extends StatefulWidget {
  const CustomSearchBarAnchor({super.key, this.controller, required this.searchBar, required this.suggestions});

  static late CustomSearchBarAnchorState state;

  final CustomSearchController? controller;
  final CustomSearchBar searchBar;
  final CustomSearchBarSuggestions suggestions;

  @override
  // ignore: no_logic_in_create_state
  State<CustomSearchBarAnchor> createState() {
    state = CustomSearchBarAnchorState();
    return state;
  }
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
    CustomSearchBarSuggestions.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        CustomSearchController.unfocus[1] = false;
        open();
      },
      onTapOutside: (e) {
        CustomSearchController.unfocus[1] = true;
        controller.requestClose();
      },
      child: CompositedTransformTarget(link: layerLink, child: widget.searchBar),
    );
  }

  void open() {
    if (entry != null) return;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (_) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + renderBox.size.height + 16,
          width: renderBox.size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, renderBox.size.height),
            child: widget.suggestions,
          ),
        );
      },
    );
    Overlay.of(context).insert(entry!);
    if (mounted) {
      setState(() {});
      controller.searchBar.setState(() {});
    }
  }

  void close() {
    if (entry != null) {
      entry?.remove();
      entry = null;

      if (mounted) {
        setState(() {});
        controller.searchBar.setState(() {});
      }
    }
  }

  void clear() {
    controller.clear();
  }
}
