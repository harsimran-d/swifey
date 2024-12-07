import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/application/auth_state_provider.dart';

import 'src/app.dart';

void main() {
  final container = ProviderContainer(overrides: [
    authStateProvider.overrideWithValue(false),
  ]);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
