import 'package:flutter/material.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: const Icon(Icons.menu_open),
      label: const Text('Menü öffnen'),
    );
  }
}
