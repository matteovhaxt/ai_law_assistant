import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

import '../../../auth/auth.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(context.padding.medium),
        child: UIColumn.gap(
          context.padding.medium,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('home.drawer.profile'.tr()),
              onTap: () => context.go('/profile'),
            ),
            ListTile(
              title: Text('home.drawer.settings'.tr()),
              onTap: () => context.go('/settings'),
            ),
            ListTile(
              title: Text('home.drawer.logout'.tr()),
              onTap: () => context.read<AuthCubit>().signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
