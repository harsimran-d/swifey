import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/onboarding/presentation/gender/gender_controller.dart';

class GenderOptions extends ConsumerWidget {
  const GenderOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(genderControllerProvider);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: gender == "Woman" ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: InkWell(
                    child: Center(
                        child: Text(
                      "Woman",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    onTap: () {
                      ref
                          .read(genderControllerProvider.notifier)
                          .update("Woman");
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: gender == "Man" ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: InkWell(
                    child: Center(
                      child: Text("Man",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    onTap: () {
                      ref.read(genderControllerProvider.notifier).update("Man");
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
