import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/profile.dart';

final profileProvider = NotifierProvider<Profiles, Profile?>(
  () => Profiles(),
);

class Profiles extends Notifier<Profile?> {
  Profiles();

  @override
  Profile? build() {
    getInitialProfiles();
    return null;
  }

  int _count = 0;
  static final _profiles = [
    Profile(
      assetName: 'assets/images/girl1.jpg',
      name: "Neha",
      age: 29,
    ),
    Profile(
      assetName: 'assets/images/girl2.jpg',
      name: "Pooja",
      age: 26,
    ),
    Profile(
      assetName: 'assets/images/girl3.jpg',
      name: "Sweety",
      age: 28,
    ),
    Profile(
      assetName: 'assets/images/girl4.jpg',
      name: "Joanne",
      age: 24,
    ),
  ];

  Future<void> getInitialProfiles() async {
    await Future.delayed(Duration(milliseconds: 800));
    state = _profiles[_count];
  }

  Future<void> fetchMoreProfiles() async {
    _count++;

    if (_count == 4) {
      _count = 0;
      state = null;
      await Future.delayed(Duration(milliseconds: 500));
    }
    state = _profiles[_count];
  }
}
