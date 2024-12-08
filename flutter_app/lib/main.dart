import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  try {
    // Pre-fetch the signed-in user data
    await container.read(authRepoProvider).getSignedInUser();
  } catch (e) {
    print("Error initializing user: $e");
  }
  runApp(UncontrolledProviderScope(
    container: container,
    child: const App(),
  ));
}
