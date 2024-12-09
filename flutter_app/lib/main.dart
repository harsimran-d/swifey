import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();

  await container.read(authRepoProvider.notifier).getSignedInUser();

  runApp(UncontrolledProviderScope(
    container: container,
    child: const App(),
  ));
}
