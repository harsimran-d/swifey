import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/dialogs/alert_dialogs.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';
import 'package:swifey/src/features/authentication/presentation/auth_controller.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  showNotImplementedAlertDialog(context: context);
                },
                leading: Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                title: Consumer(builder: (context, ref, _) {
                  final user = ref.watch(authRepoProvider);
                  String email = "";
                  if (user != null) {
                    email = user.email;
                  }
                  return Text(
                    email,
                    textAlign: TextAlign.end,
                  );
                }),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                ),
              ),
              Divider(
                height: 0.2,
                thickness: 0.1,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                onTap: () {
                  showNotImplementedAlertDialog(context: context);
                },
                leading: Text(
                  'Phone number',
                  style: TextStyle(fontSize: 16),
                ),
                title: Text(
                  '9999999999',
                  textAlign: TextAlign.end,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  showNotImplementedAlertDialog(context: context);
                },
                leading: Text(
                  'Location',
                  style: TextStyle(fontSize: 16),
                ),
                title: Text(
                  'Unknown',
                  textAlign: TextAlign.end,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                ),
              ),
              const Divider(
                height: 0.2,
                thickness: 0.1,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                color: const Color(0xFFF1F3F4),
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onTap: () {
                    showNotImplementedAlertDialog(context: context);
                    // ! Reclaim Disabled until fix is found
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ReclaimExample()));
                  },
                  leading: const Text(
                    'Status',
                    style: TextStyle(fontSize: 16),
                  ),
                  title: const Text(
                    'Not Verified',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Consumer(builder: (context, ref, widget) {
            return InkWell(
              onTap: () {
                ref.read(authControllerProvider.notifier).logout();
              },
              child: const Center(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
