import 'package:flutter/material.dart';

import './widgets/code_entry.dart';

class CodeEntryView extends StatefulWidget {
  const CodeEntryView({super.key, required this.phone});

  final String phone;

  @override
  State<CodeEntryView> createState() => _CodeEntryViewState();
}

class _CodeEntryViewState extends State<CodeEntryView> {
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
                      "Verify your phone number",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      "We’ve sent a 6-digit verification code to ${widget.phone}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    CodeTextField(),
                  ],
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [Icon(Icons.check), Text("Verify & Continue")],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Didn't receive code?"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(fontWeight: .bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
