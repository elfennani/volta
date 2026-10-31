import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:volta/core/components/app_transition.dart';
import 'package:volta/core/theme/theme.dart';
import 'package:volta/features/authentication/presentation/views/code_entry_view.dart';
import 'package:volta/features/authentication/presentation/views/phone_entry_view.dart';
import 'package:volta/features/authentication/presentation/views/welcome_view.dart';

final router = GoRouter(
  initialLocation: "/code",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => AppTransition(child: WelcomeView()),
    ),
    GoRoute(
      path: "/phone-entry",
      pageBuilder: (context, state) => AppTransition(child: PhoneEntryView()),
    ),
    GoRoute(
      path: "/code",
      pageBuilder: (context, state) => AppTransition(child: CodeEntryView()),
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Volta',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
