import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:volta/presentation/views/auth/phone_entry_controller.dart';

class PhoneEntryView extends ConsumerStatefulWidget {
  const PhoneEntryView({super.key});

  @override
  ConsumerState<PhoneEntryView> createState() => _PhoneEntryViewState();
}

class _PhoneEntryViewState extends ConsumerState<PhoneEntryView> {
  String phone = "";

  @override
  Widget build(BuildContext context) {
    ref.listen(phoneEntryControllerProvider, (previous, next) {
      if (previous?.isLoading == true && !next.isLoading && !next.hasError) {
        context.push("/code/+212$phone");
      }
    });
    final authState = ref.watch(phoneEntryControllerProvider);

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
                      enabled: !authState.isLoading,
                      keyboardType: .phone,
                      autofocus: true,
                      onChanged: (text) => setState(() {
                        phone = text;
                      }),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixText: "🇲🇦 +212 ",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: authState.isLoading
                          ? null
                          : () {
                              ref
                                  .read(phoneEntryControllerProvider.notifier)
                                  .requestCode("+212$phone");
                            },
                      child: Row(
                        mainAxisAlignment: .center,
                        spacing: 16,
                        children: [
                          authState.isLoading
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
                    if (authState.hasError) ...[
                      SizedBox(height: 8),
                      Text(
                        "Error: ${authState.error}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
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
