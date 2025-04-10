import 'package:flutter/material.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_bar_anchor.dart';
import 'package:mvvm/core/widgets/custom_search_bar/custom_search_controller.dart';
import 'package:mvvm/core/widgets/custom_search_bar/search_bar_icon.dart';
import 'package:mvvm/utils/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.width,
    this.height = 56,
    this.bgColor = AppColors.mono0,
    this.borderRadius = 28,
    this.padding = EdgeInsets.zero,
    this.constraints = const BoxConstraints(maxWidth: 720),
    this.leftPadding = 25,
    this.leading = const SearchBarIcon(icons: [Icon(Icons.search, size: 24, color: Colors.grey)]),
    this.trailing,
  });

  final double? width;
  final double height;
  final double borderRadius;
  final BoxConstraints constraints;
  final double leftPadding;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final SearchBarIcon? trailing;
  final SearchBarIcon leading;

  static CustomSearchBarAnchorState? of(BuildContext context) {
    return context.findAncestorStateOfType<CustomSearchBarAnchorState>();
  }

  @override
  State<CustomSearchBar> createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  CustomSearchController? controller;

  @override
  void initState() {
    super.initState();
    controller = CustomSearchBar.of(context)?.controller;
    controller?.searchBar = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      padding: widget.padding,
      decoration: BoxDecoration(borderRadius: getBorderRadius(), color: widget.bgColor),
      child: Row(
        children: [
          widget.leading,
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(border: InputBorder.none, hintText: 'Search', hintStyle: TextStyle(color: Colors.grey)),
              onTap: () {
                controller?.open();
              },
            ),
          ),
          if (widget.trailing != null) widget.trailing! else SizedBox(width: widget.leftPadding),
        ],
      ),
    );
  }

  BorderRadiusGeometry getBorderRadius() {
    assert(controller != null);
    if (controller!.isOpen) {
      return BorderRadius.only(topLeft: Radius.circular(widget.borderRadius), topRight: Radius.circular(widget.borderRadius));
    } else {
      return BorderRadius.all(Radius.circular(widget.borderRadius));
    }
  }
}
