import 'dart:html' as html;

import 'package:drop_zone/drop_zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

import '../../submit.dart';

class SubmitPdfInput extends StatelessWidget {
  const SubmitPdfInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SubmitCubit>();
    return OutlinedButton(
      onPressed: () async => cubit.inputPdf(),
      child: DropZone(
        onDrop: (List<html.File>? files) {
          context.logger.i('drop');
        },
        child: UIColumn.gap(
          context.padding.medium,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.file_open,
            ),
            Text(
              'Datei in dieses Feld ziehen oder klicken um eine Datei auszuwählen.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
