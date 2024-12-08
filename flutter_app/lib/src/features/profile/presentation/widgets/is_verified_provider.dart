import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsVerified extends Notifier<bool> {
  IsVerified();

  @override
  bool build() {
    return false;
  }

  void requestVerification() {
    state = true;
  }
}

final isVerifiedProvider = NotifierProvider(() {
  return IsVerified();
});
