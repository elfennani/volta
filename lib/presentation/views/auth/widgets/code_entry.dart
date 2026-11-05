import 'package:flutter/material.dart';

class CodeTextField extends StatefulWidget {
  const CodeTextField({super.key});

  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  final List<(FocusNode, TextEditingController)> inputs = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 6; i++) {
      final focusNode = FocusNode();
      final controller = TextEditingController();

      controller.addListener(() {
        if (controller.text.length == 6) {
          final code = controller.text;
          for (var i = 0; i < 6; i++) {
            final (focus, innerController) = inputs[i];

            final text = code[i];
            innerController.value = innerController.value.copyWith(text: text);

            if (i == 5) {
              focus.requestFocus();
            }
          }
        } else {
          controller.value = controller.value.copyWith(text: controller.text[0]);
        }
      });

      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        }
      });

      inputs.add((focusNode, controller));
    }
  }

  @override
  void dispose() {
    for (final input in inputs) {
      input.$1.dispose();
      input.$2.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        for (final input in inputs)
          Expanded(
            child: TextField(
              keyboardType: .number,
              textAlign: .center,
              focusNode: input.$1,
              controller: input.$2,
              onChanged: (text) {
                print("text changed: $text");
                if (text.isNotEmpty && input.$1.hasFocus) {
                  inputs[inputs.indexOf(input) + 1].$1.requestFocus();
                }
              },
              onSubmitted: (_) {
                inputs[inputs.indexOf(input) + 1].$1.requestFocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),
          ),
      ],
    );
  }
}
