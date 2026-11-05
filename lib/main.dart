import 'package:flutter/material.dart' show runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volta/presentation/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
