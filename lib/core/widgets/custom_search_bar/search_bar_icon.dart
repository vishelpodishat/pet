import 'package:flutter/material.dart';

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.icons = const [],
    this.spacing = 16,
  });

  final EdgeInsetsGeometry padding;
  final double spacing;
  final List<Widget> icons;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: Row(children: getIcons()));
  }

  List<Widget> getIcons() {
    return List.generate(icons.length, (index) {
      if (index == icons.length - 1) return icons[index];
      return Row(children: [icons[index], SizedBox(width: spacing)]);
    });
  }
}
