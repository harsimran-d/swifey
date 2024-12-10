import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailController extends Notifier<String> {
  EmailController();

  @override
  String build() {
    return "";
  }

  void updateEmail(String email) {
    state = email;
  }
}

final emailControllerProvider = NotifierProvider<EmailController, String>(() {
  return EmailController();
});

final hiddenEmailProvider = Provider.autoDispose<String>((Ref ref) {
  final email = ref.watch(emailControllerProvider);

  final parts = email.split("@");
  if (parts[0].length > 2) {
    final stars = "*" * (parts[0].length - 2);
    final String hiddenStart =
        parts[0][0] + stars + parts[0][parts[0].length - 1];
    return "$hiddenStart@${parts[1]}";
  } else {
    return "**@${parts[1]}";
  }
});

final isValidEmailProvider = Provider.autoDispose<bool>((Ref ref) {
  final email = ref.watch(emailControllerProvider);
  final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  if (emailRegExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
});
