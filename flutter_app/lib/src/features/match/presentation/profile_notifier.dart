import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/match/data/dummy_data.dart';

import '../domain/profile.dart';

final profileProvider = NotifierProvider<Profiles, (Profile?, Profile?)>(
  () => Profiles(),
);

class Profiles extends Notifier<(Profile?, Profile?)> {
  Profiles();

  @override
  (Profile?, Profile?) build() {
    getInitialProfiles();
    return (null, null);
  }

  int _index = 0;
  static final _profiles = dummyData.map((json) {
    return Profile.fromMap(json);
  }).toList();

  Future<void> getInitialProfiles() async {
    await Future.delayed(Duration(milliseconds: 800));
    Profile? profile;
    Profile? nextProfile;
    if (_profiles.isEmpty || _profiles.length < _index) {
      state = (profile, nextProfile);
      return;
    }
    profile = _profiles[_index];
    if (_profiles.length > _index + 1) {
      nextProfile = _profiles[_index + 1];
    }
    state = (profile, nextProfile);
  }

  Future<void> fetchMoreProfiles() async {
    _index++;
    Profile? profile;
    Profile? nextProfile;
    if (_index == _profiles.length) {
      _index = 0;
      state = (profile, nextProfile);
      await Future.delayed(Duration(milliseconds: 900));
    }
    profile = _profiles[_index];
    if (_profiles.length > _index + 1) {
      nextProfile = _profiles[_index + 1];
    }
    state = (profile, nextProfile);
  }
}
