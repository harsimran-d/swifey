import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/onboarding/presentation/interest/interest_controller.dart';

class InterestOptions extends ConsumerWidget {
  const InterestOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interest = ref.watch(interestControllerProvider);
    return Column(
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
                      color: interest == "Women" ? Colors.red : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  child: Center(
                      child: Text(
                    "Women",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  onTap: () {
                    ref
                        .read(interestControllerProvider.notifier)
                        .update("Women");
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
                      color: interest == "Men" ? Colors.red : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  child: Center(
                    child: Text("Men",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  onTap: () {
                    ref.read(interestControllerProvider.notifier).update("Men");
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
                      color: interest == "Everyone" ? Colors.red : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  child: Center(
                    child: Text("Everyone",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  onTap: () {
                    ref
                        .read(interestControllerProvider.notifier)
                        .update("Everyone");
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
