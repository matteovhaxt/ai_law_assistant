import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

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
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                context.mediaQuery.size.height * (context.isDesktop ? .5 : .8),
            maxWidth:
                context.mediaQuery.size.width * (context.isDesktop ? .5 : .8),
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(context.padding.extraBig),
              child: OutlinedButton(
                onPressed: () => context.go('/submit'),
                child: UIColumn.gap(
                  context.padding.medium,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.edit_document,
                    ),
                    Text(
                      'home.input_selection.pdf'.tr(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
