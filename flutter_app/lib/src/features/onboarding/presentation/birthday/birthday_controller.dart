import 'package:flutter_riverpod/flutter_riverpod.dart';

class BirthdayController extends Notifier<DateTime> {
  BirthdayController();

  @override
  DateTime build() {
    return DateTime(DateTime.now().year - 18, 1, 1);
  }

  void updateBirthday(DateTime dateTime) {
    print(dateTime);
    state = dateTime;
  }
}

final birthdayControllerProvider =
    NotifierProvider<BirthdayController, DateTime>(() {
  return BirthdayController();
});
