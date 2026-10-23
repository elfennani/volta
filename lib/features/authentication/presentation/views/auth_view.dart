import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  Future<void> launchAuth() async {
    if(await launchUrl(Uri.parse("https://www.google.com"))){
      throw Exception("Could not start auth");
    }
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
                  child: Text(
                    "Welcome to Kiroku!",
                    textAlign: .center,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: launchAuth,
                style: ButtonStyle(
                  backgroundColor: .all(Theme.of(context).colorScheme.primary),
                  foregroundColor: .all(Theme.of(context).colorScheme.onPrimary)
                ),
                child: const Text("Log in with AniList"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
