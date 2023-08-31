import 'package:flutter/material.dart';
import 'package:flutter_app/app/app.dart';
import 'package:flutter_app/core/core.dart';

import 'features/auth/auth.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('de')],
        fallbackLocale: const Locale('de'),
        child: const App(),
      ),
    );
  }
}
