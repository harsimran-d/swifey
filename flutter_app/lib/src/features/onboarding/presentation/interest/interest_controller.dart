import 'package:flutter_riverpod/flutter_riverpod.dart';

class InterestController extends Notifier<String> {
  InterestController();

  @override
  String build() {
    ref.onDispose(() => print("interest controller was disposed"));
    return "";
  }

  void update(String interest) {
    state = interest;
  }
}

final interestControllerProvider =
    NotifierProvider<InterestController, String>(() {
  return InterestController();
});
