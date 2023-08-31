import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

class HomeInputSelection extends StatelessWidget {
  const HomeInputSelection({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        onPressed: onPressed,
        child: UIColumn.gap(
          context.padding.medium,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
