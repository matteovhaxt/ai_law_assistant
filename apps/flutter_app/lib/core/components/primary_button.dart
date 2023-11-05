import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

class UIPrimaryButton extends StatelessWidget {
  const UIPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.leading,
    this.trailing,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: ValueKey(isDisabled),
      onPressed: isDisabled ? null : onPressed,
      child: Padding(
        padding: EdgeInsets.all(context.padding.medium),
        child: isLoading
            ? const CircularProgressIndicator()
            : UIRow.gap(
                context.padding.medium,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: leading ?? const SizedBox.shrink(),
                  ),
                  Text(title),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: trailing ?? const SizedBox.shrink(),
                  ),
                ],
              ),
      ),
    );
  }
}
