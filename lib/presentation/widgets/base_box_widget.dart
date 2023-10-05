import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

import '../../resources/app_theme_data.dart';

class BaseBoxWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final Axis direction;
  final TextDirection textDirection;
  final BoxConstraints? constraints;

  const BaseBoxWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.constraints,
      this.direction = Axis.vertical,
      this.textDirection = TextDirection.ltr});

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
        child: direction == Axis.vertical
            ? Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                icon,
                5.heightBox,
                Flexible(
                    child: Text(
                  title,
                  textDirection: textDirection,
                  style: Theme.of(context).textTheme.displayMedium,
                )),
                if (subtitle != null)
                  Flexible(
                      child: Text(
                    subtitle!,
                    textDirection: textDirection,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ))
              ])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: () {
                  final children = [
                    icon,
                    5.widthBox,
                    Flexible(child:Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      if (title.isNotEmpty)
                        Flexible(
                            child: Text(
                          title,
                          style: Theme.of(context).textTheme.displayMedium,
                        )),
                      if (subtitle != null)
                        Flexible(
                            child: Text(
                          subtitle!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ))
                    ]))
                  ];
                  if (textDirection == TextDirection.rtl) {
                    return children.reversed.toList();
                  }

                  return children;
                }()));
  }
}
