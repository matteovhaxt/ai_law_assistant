import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UIFlex extends StatelessWidget {
  const UIFlex({
    super.key,
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clip,
    this.separator,
    required this.children,
  });

  UIFlex.separated({
    Key? key,
    required Axis direction,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Clip? clip,
    Widget? separator,
    required List<Widget> children,
  }) : this(
          key: key,
          direction: direction,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          clip: clip,
          separator: const SizedBox(
            height: 16,
          ),
          children: List.generate(
            children.length * 2 - 1,
            (index) => index % 2 == 0
                ? children[index ~/ 2]
                : separator ?? const SizedBox.shrink(),
          ),
        );

  UIFlex.gap(
    double gap, {
    Key? key,
    required Axis direction,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Clip? clip,
    required List<Widget> children,
  }) : this(
          key: key,
          direction: direction,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          clip: clip,
          separator: const SizedBox(
            height: 16,
          ),
          children: List.generate(
            children.length * 2 - 1,
            (index) => index % 2 == 0
                ? children[index ~/ 2]
                : Gap(
                    gap,
                  ),
          ),
        );

  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip? clip;
  final Widget? separator;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Flex(
      key: key,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );
  }
}
