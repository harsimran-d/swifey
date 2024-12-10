import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';

import 'settings/settings_list.dart';
import 'widgets/name_tag.dart';
import 'widgets/profile_photo.dart';
import 'widgets/top_bar.dart';
import 'widgets/verified_status.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepoProvider)!;
    final name = user.name;
    final age = user.birthday.difference(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TopBar(),
                SizedBox(
                  height: 20,
                ),
                ProfilePhoto(),
                SizedBox(
                  height: 10,
                ),
                NameTag(
                  name: name,
                  age: (age.abs().inDays / 365).floor().toString(),
                ),
                VerifiedStatus(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SettingsList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
