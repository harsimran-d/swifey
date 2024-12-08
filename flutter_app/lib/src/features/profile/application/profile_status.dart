import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/router/router.dart';

class ProfileStatus extends AsyncNotifier<bool> {
  ProfileStatus();

  @override
  bool build() {
    return false;
  }

  void createProfile() {
    state = const AsyncValue.data(true);
    ref.read(goRouterProvider).goNamed(AppRoutes.match.name);
  }
}

final profileStatusProvider = AsyncNotifierProvider<ProfileStatus, bool>(() {
  return ProfileStatus();
});
