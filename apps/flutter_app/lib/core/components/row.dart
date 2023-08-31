import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

class UIRow extends UIFlex {
  const UIRow({
    super.key,
    super.direction = Axis.horizontal,
    required super.children,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    super.separator,
  });

  UIRow.separated({
    super.key,
    super.direction = Axis.horizontal,
    required super.children,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    super.separator,
  }) : super.separated();

  UIRow.gap(
    double gap, {
    super.key,
    super.direction = Axis.horizontal,
    required super.children,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  }) : super.gap(
          gap,
        );
}
