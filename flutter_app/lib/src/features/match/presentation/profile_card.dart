import 'package:flutter/material.dart';

import '../domain/profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            profile.assetName,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        profile.name,
                        style: TextStyle(fontSize: 30),
                      ),
                      Spacer(),
                      Text(
                        profile.age.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
