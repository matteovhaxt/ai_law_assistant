import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

class UIColumn extends UIFlex {
  const UIColumn({
    super.key,
    super.direction = Axis.vertical,
    required super.children,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    super.separator,
  });

  UIColumn.separated({
    super.key,
    super.direction = Axis.vertical,
    required super.children,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    super.separator,
  }) : super.separated();

  UIColumn.gap(
    double gap, {
    super.key,
    super.direction = Axis.vertical,
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
