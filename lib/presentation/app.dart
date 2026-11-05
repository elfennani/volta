import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:volta/presentation/widgets/app_transition.dart';
import 'package:volta/presentation/theme/theme.dart';
import 'package:volta/presentation/views/auth/code_entry_view.dart';
import 'package:volta/presentation/views/auth/phone_entry_view.dart';
import 'package:volta/presentation/views/auth/welcome_view.dart';

final router = GoRouter(
  initialLocation: "/",
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
      path: "/code/:phone",
      pageBuilder: (context, state) => AppTransition(
        child: CodeEntryView(phone: state.pathParameters["phone"]!),
      ),
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
