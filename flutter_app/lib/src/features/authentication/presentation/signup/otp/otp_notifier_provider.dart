import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpNotifierProvider extends StateNotifier<Map<int, String>> {
  OtpNotifierProvider() : super({});
  void updateOtp(int index, String otpDigit) {
    final newState = {...state};
    newState[index] = otpDigit;
    state = newState;
  }
}

final otpNotifierProvider =
    StateNotifierProvider.autoDispose<OtpNotifierProvider, Map<int, String>>(
        (_) {
  return OtpNotifierProvider();
});

final isOTPCompletedProvider = Provider.autoDispose<bool>((Ref ref) {
  final otp = ref.watch(otpNotifierProvider);
  print(otp);
  print(otp.length);
  if (otp.length < 6 ||
      (otp.values.any((digit) => digit.isEmpty || digit == ""))) {
    print('returning false');
    return true;
  } else {
    print('returning true');

    return false;
  }
});
