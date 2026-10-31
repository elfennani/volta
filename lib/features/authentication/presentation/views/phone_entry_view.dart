import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneEntryView extends StatefulWidget {
  const PhoneEntryView({super.key});

  @override
  State<PhoneEntryView> createState() => _PhoneEntryViewState();
}

class _PhoneEntryViewState extends State<PhoneEntryView> {
  bool isLoading = false;

  Future<void> load() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds:1));
    if (mounted) {
      context.push("/code");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            64,
            16,
            16,
          ).add(EdgeInsets.zero),
          child: SingleChildScrollView(
            child: Column(
              spacing: 32,
              crossAxisAlignment: .stretch,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: 16,
                  children: [
                    // This square is supposed to be the placeholder for the logo
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        color: Colors.grey,
                        width: 64,
                        height: 64,
                      ),
                    ),
                    Text(
                      "Welcome to Volta!",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      "Enter your phone number to get started. We’ll send you a verification code to confirm it’s you.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextField(
                      keyboardType: .phone,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixText: "🇲🇦 +212 ",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: !isLoading ? load : null,
                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [
                        isLoading
                            ? Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    strokeCap: .round,
                                  ),
                                ),
                              )
                            : Icon(Icons.send),
                        Text("Continue"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
