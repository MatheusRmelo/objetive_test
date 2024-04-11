import 'package:flutter/material.dart';
import 'package:objetive_test/constants/marvel_colors.dart';

class MarvelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarvelAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 24,
      title: Row(
        children: [
          const _AppBarTitleText(
            hasHighlight: true,
            child: Text(
              'BUSCA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const _AppBarTitleText(
              child: Text(
            'MARVEL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          if (title != null) _AppBarTitleText(child: Text(title!))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(kToolbarHeight, kToolbarHeight);
}

class _AppBarTitleText extends StatelessWidget {
  const _AppBarTitleText({required this.child, this.hasHighlight = false});
  final Text child;
  final bool hasHighlight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 2,
                  color: hasHighlight
                      ? Theme.of(context).appBarTheme.titleTextStyle?.color ??
                          MarvelColors.textTitleColor
                      : Colors.transparent))),
      child: child,
    );
  }
}
