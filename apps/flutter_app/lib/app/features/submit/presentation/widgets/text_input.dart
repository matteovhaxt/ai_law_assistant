import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

import '../../submit.dart';

class SubmitTextInput extends StatelessWidget {
  const SubmitTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SubmitCubit>();
    final textController = TextEditingController();
    return SingleChildScrollView(
      child: UIRow.gap(
        context.padding.medium,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: TextField(
              controller: textController,
              autofocus: true,
              minLines: 1,
              maxLines: null,
            ),
          ),
          IconButton(
            onPressed: () => cubit.inputText(textController.text),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
