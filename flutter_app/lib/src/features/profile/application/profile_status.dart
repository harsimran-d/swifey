import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';

class ProfileStatus extends AsyncNotifier<bool> {
  ProfileStatus();

  @override
  bool build() {
    return false;
  }

  void createProfile() {
    state = const AsyncValue.data(true);
    ref.read(authRepoProvider).signInWithFakeUser();
  }
}

final profileStatusProvider = AsyncNotifierProvider<ProfileStatus, bool>(() {
  return ProfileStatus();
});
