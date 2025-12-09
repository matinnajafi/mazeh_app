import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(child: const Center(child: Text('Profile Screen'))),
    );
  }
}
