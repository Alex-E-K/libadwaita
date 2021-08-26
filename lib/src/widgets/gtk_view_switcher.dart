import 'package:flutter/material.dart';
import 'package:gtk/src/models/models.dart';
import 'package:gtk/src/utils/utils.dart';

import 'widgets.dart';

class GtkViewSwitcher extends StatelessWidget {
  final List<ViewSwitcherData> tabs;
  final ValueChanged<int> onViewChanged;
  final ViewSwitcherStyle style;
  final int currentIndex;

  const GtkViewSwitcher({
    Key? key,
    required this.tabs,
    required this.onViewChanged,
    required this.currentIndex,
    this.style = ViewSwitcherStyle.desktop,
  })  : assert(tabs.length >= 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final tab in tabs.asMap().entries)
          InkWell(
            onTap:
                currentIndex != tab.key ? () => onViewChanged(tab.key) : null,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: tab.key == currentIndex
                    ? getAdaptiveGtkColor(
                        context,
                        colorType: GtkColorType.headerSwitcherTabBackground,
                      )
                    : Colors.transparent,
                border: Border.symmetric(
                  vertical: BorderSide(
                    width: 1,
                    color: tab.key == currentIndex
                        ? getAdaptiveGtkColor(
                            context,
                            colorType: GtkColorType.headerSwitcherTabBorder,
                          )
                        : Colors.transparent,
                  ),
                ),
              ),
              child: GtkViewSwitcherTab(
                data: tab.value,
                isSelected: tab.key == currentIndex,
                style: style,
              ),
            ),
          )
      ],
    );
  }
}
