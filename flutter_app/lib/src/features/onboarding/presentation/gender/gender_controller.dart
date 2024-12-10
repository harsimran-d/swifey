import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderController extends Notifier<String> {
  GenderController();

  @override
  String build() {
    return "";
  }

  void update(String gender) {
    state = gender;
  }
}

final genderControllerProvider = NotifierProvider<GenderController, String>(() {
  return GenderController();
});
