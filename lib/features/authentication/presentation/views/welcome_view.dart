import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  Future<void> launchAuth() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            mainAxisSize: .max,
            spacing: 16,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Text(
                        "Volta",
                        textAlign: .center,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Opacity(
                        opacity: 0.75,
                        child: Text("Your city, your ride"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () => context.push("/phone-entry"),
                  child: Text(
                    "Sign up for Volta",
                    style: TextStyle(
                      fontWeight: .bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
