import 'package:flutter/material.dart';

import '../../resources/app_theme_data.dart';
import 'base_box_widget.dart';

class HorizontalBoxWidget extends BaseBoxWidget {
  const HorizontalBoxWidget(
      {super.key,
      required super.icon,
      required super.title,
      super.subtitle,
      super.constraints,
      super.direction = Axis.horizontal,
      super.textDirection = TextDirection.ltr});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        constraints: constraints,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisAlignment: textDirection == TextDirection.rtl ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: () {
              final children = [
                Flexible(
                  flex: 1,
                  child: icon,
                ),
                Flexible(
                    flex: 4,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ];
              if (textDirection == TextDirection.rtl) {
                return children.reversed.toList();
              }

              return children;
            }()));
  }
}
