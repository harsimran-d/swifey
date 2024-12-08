import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/presentation/otp/otp_notifier_provider.dart';

class OtpInputField extends ConsumerStatefulWidget {
  const OtpInputField({
    super.key,
  });

  @override
  ConsumerState<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends ConsumerState<OtpInputField> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to the next focus node if there is one
      if (index + 1 < _focusNodes.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        // Unfocus the last field

        _focusNodes[index].unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 48,
          margin: const EdgeInsets.only(right: 8),
          child: TextField(
              keyboardType: const TextInputType.numberWithOptions(),
              focusNode: _focusNodes[index],
              maxLength: 1,
              buildCounter: null,
              decoration: const InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ))),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30),
              onChanged: (value) {
                ref.read(otpNotifierProvider.notifier).updateOtp(index, value);
                _onChanged(value, index);
              }),
        );
      }),
    );
  }
}
