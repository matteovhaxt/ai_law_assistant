import 'package:flutter/material.dart';
import 'package:flutter_app/app/features/home/presentation/widgets/input_selection.dart';
import 'package:flutter_app/core/core.dart';
import 'package:wolt_responsive_layout_grid/wolt_responsive_layout_grid.dart';

import '../../../submit/submit.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Page page() => const MaterialPage(
        child: HomeScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomeFloatingActionButton(),
      drawer: const HomeDrawer(),
      body: WoltResponsiveLayoutGrid.centered(
        centerWidgetColumnCount: context.wideCenterWidgetFlex,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(context.padding.extraBig),
            child: UIRow.gap(
              context.padding.medium,
              children: [
                Flexible(
                  child: HomeInputSelection(
                    text: 'home.input_selection.text'.tr(),
                    icon: Icons.text_snippet,
                    onPressed: () =>
                        context.go('/submit?method=${SubmitMethod.text.name}'),
                  ),
                ),
                Flexible(
                  child: HomeInputSelection(
                    text: 'home.input_selection.pdf'.tr(),
                    icon: Icons.edit_document,
                    onPressed: () =>
                        context.go('/submit?method=${SubmitMethod.pdf.name}'),
                  ),
                ),
                Flexible(
                  child: HomeInputSelection(
                    text: 'home.input_selection.camera'.tr(),
                    icon: Icons.camera_alt,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
