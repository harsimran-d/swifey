import 'package:flutter/material.dart';

import 'settings/settings_list.dart';
import 'widgets/name_tag.dart';
import 'widgets/profile_photo.dart';
import 'widgets/top_bar.dart';
import 'widgets/verified_status.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                NameTag(),
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
