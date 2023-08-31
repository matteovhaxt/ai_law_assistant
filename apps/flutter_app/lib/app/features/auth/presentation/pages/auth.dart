import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';
import 'package:wolt_responsive_layout_grid/wolt_responsive_layout_grid.dart';

import '../../auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen._();

  static Page page() => MaterialPage(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, _) => const AuthScreen._(),
        ),
      );

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool isEmailValid;
  late bool isPasswordValid;

  @override
  void initState() {
    tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
      animationDuration: context.animation.medium,
    );
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isEmailValid = false;
    isPasswordValid = false;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        emailController.clear();
        passwordController.clear();
      }
    });

    emailController.addListener(
      () => setState(
        () => isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(emailController.text),
      ),
    );

    passwordController.addListener(
      () => setState(
        () => isPasswordValid =
            RegExp(r'^.{8,}$').hasMatch(passwordController.text),
      ),
    );

    List<Widget> tabs = [
      [
        Text(
          'auth.login.headline'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headlineMedium,
        ),
        Text(
          'auth.login.title'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => isEmailValid ? null : 'auth.invalid-email'.tr(),
          decoration: InputDecoration(
            label: Text(
              'auth.email'.tr(),
            ),
          ),
          controller: emailController,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            label: Text(
              'auth.password'.tr(),
            ),
          ),
          controller: passwordController,
        ),
        ElevatedButton(
          onPressed: isEmailValid && isPasswordValid
              ? () => cubit.signInWithEmail(
                    context,
                    email: emailController.text,
                    password: passwordController.text,
                  )
              : null,
          child: Text(
            'global.confirm'.tr(),
          ),
        ),
        TextButton(
          onPressed: () => tabController.animateTo(1),
          child: Text(
            'global.back'.tr(),
          ),
        ),
      ],
      [
        Text(
          'auth.headline'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headlineMedium,
        ),
        Text(
          'auth.title'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium,
        ),
        ElevatedButton(
          onPressed: () => tabController.animateTo(2),
          child: Text(
            'auth.register.headline'.tr(),
          ),
        ),
        OutlinedButton(
          onPressed: () => tabController.animateTo(0),
          child: Text(
            'auth.login.headline'.tr(),
          ),
        ),
      ],
      [
        Text(
          'auth.register.headline'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headlineMedium,
        ),
        Text(
          'auth.register.title'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => isEmailValid ? null : 'auth.invalid-email'.tr(),
          decoration: InputDecoration(
            label: Text(
              'auth.email'.tr(),
            ),
          ),
          controller: emailController,
        ),
        TextFormField(
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              isPasswordValid ? null : 'auth.invalid-password'.tr(),
          decoration: InputDecoration(
            label: Text(
              'auth.password'.tr(),
            ),
          ),
          controller: passwordController,
        ),
        ElevatedButton(
          onPressed: isEmailValid && isPasswordValid
              ? () => cubit.createAccountWithEmail(
                    context,
                    email: emailController.text,
                    password: passwordController.text,
                  )
              : null,
          child: Text(
            'global.confirm'.tr(),
          ),
        ),
        TextButton(
          onPressed: () => tabController.animateTo(1),
          child: Text(
            'global.back'.tr(),
          ),
        ),
      ],
    ]
        .map(
          (tab) => WoltResponsiveLayoutGrid.centered(
            centerWidgetColumnCount: context.centerWidgetFlex,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(context.padding.extraBig),
                child: UIColumn.gap(
                  context.padding.medium,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: tab,
                ),
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: tabs,
      ),
    );
  }
}
