import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameController extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void updateName(String value) {
    String capitalize(String input) {
      if (input.isEmpty) return input;
      return input[0].toUpperCase() + input.substring(1);
    }

    state = capitalize(value);
  }
}

final nameControllerProvider = NotifierProvider<NameController, String>(() {
  return NameController();
});
