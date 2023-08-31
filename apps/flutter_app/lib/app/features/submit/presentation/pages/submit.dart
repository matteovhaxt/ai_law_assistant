import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';
import 'package:wolt_responsive_layout_grid/wolt_responsive_layout_grid.dart';

import '../../submit.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen._();

  static Page page(SubmitMethod method) => MaterialPage(
        child: BlocProvider(
          create: (context) => SubmitCubit(method),
          child: const SubmitScreen._(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WoltResponsiveLayoutGrid.centered(
        centerWidgetColumnCount: context.wideCenterWidgetFlex,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: context.mediaQuery.size.height * .5,
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(context.padding.extraBig),
              child: Builder(builder: (context) {
                final cubit = context.watch<SubmitCubit>();
                if (cubit.state.isLoading) {
                  return const CircularProgressIndicator();
                }
                switch (cubit.state.method) {
                  case SubmitMethod.text:
                    return const SubmitTextInput();
                  case SubmitMethod.pdf:
                    return const SubmitPdfInput();
                  default:
                    throw UnimplementedError();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
