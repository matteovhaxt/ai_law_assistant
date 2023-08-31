import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

import 'features/auth/auth.dart';
import 'features/home/home.dart';
import 'features/profile/profile.dart';
import 'features/settings/settings.dart';
import 'features/submit/submit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      refreshListenable: Listenable.merge(
        [
          StreamListenable(
            context.read<AuthCubit>().stream,
          ),
        ],
      ),
      redirect: (context, state) {
        final authCubit = context.read<AuthCubit>();

        if (authCubit.state.isAuthenticated == false) {
          return '/auth';
        } else if (authCubit.state.isAuthenticated == true &&
            state.location == '/auth') {
          return '/';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/auth',
          pageBuilder: (context, state) => AuthScreen.page(),
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => HomeScreen.page(),
          routes: [
            GoRoute(
              path: 'profile',
              pageBuilder: (context, state) => ProfileScreen.page(),
            ),
            GoRoute(
              path: 'settings',
              pageBuilder: (context, state) => SettingsScreen.page(),
            ),
            GoRoute(
              path: 'submit',
              pageBuilder: (context, state) {
                final method = state.queryParameters['method'];
                if (method == null) throw UnimplementedError();
                return SubmitScreen.page(
                  SubmitMethod.values.byName(method),
                );
              },
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.highContrastLight(),
      ),
      darkTheme: ThemeData.from(
        colorScheme: const ColorScheme.highContrastDark(),
      ),
    );
  }
}
