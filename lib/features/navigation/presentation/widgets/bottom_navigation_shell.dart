import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class BottomNavigationShell extends StatelessWidget {
  final Widget child;
  final String location;

  const BottomNavigationShell({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // darker shadow
              blurRadius: 12,
              spreadRadius: -24,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: calculateSelectedIndex(location),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.red,
          unselectedItemColor: AppColor.greytextColor,
          backgroundColor: Colors.white,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontFamily: 'CSB'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'CM'),
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/profile');
                break;
              case 1:
                context.go('/save');
                break;
              case 2:
                context.go('/add');
                break;
              case 3:
                context.go('/refrigerator');
                break;
              case 4:
                context.go('/home');
                break;
            }
          },
          items: [
            buildNavItem(
              iconPath: 'images/icon_profile.png',
              activeIconPath: 'images/icon_active_profile.png',
              label: 'پروفایل',
            ),
            buildNavItem(
              iconPath: 'images/icon_bookmark.png',
              activeIconPath: 'images/icon_active_bookmark.png',
              label: 'ذخیره شده‌ها',
            ),
            buildNavItem(
              iconPath: 'images/icon_add.png',
              activeIconPath: 'images/icon_active_add.png',
              label: 'اضافه کردن',
            ),
            buildNavItem(
              iconPath: 'images/icon_refrigerator.png',
              activeIconPath: 'images/icon_active_refrigerator.png',
              label: 'یخچال من',
              size: 20,
            ),
            buildNavItem(
              iconPath: 'images/icon_home.png',
              activeIconPath: 'images/icon_active_home.png',
              label: 'خانه',
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem buildNavItem({
  required String iconPath,
  required String activeIconPath,
  required String label,
  double size = 22,
}) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: ImageIcon(AssetImage(iconPath), size: size),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: ImageIcon(AssetImage(activeIconPath), size: size),
    ),
    label: label,
  );
}

int calculateSelectedIndex(String location) {
  if (location.startsWith('/profile')) return 0;
  if (location.startsWith('/save')) return 1;
  if (location.startsWith('/add')) return 2;
  if (location.startsWith('/refrigerator')) return 3;
  if (location.startsWith('/home')) return 4;
  return 4;
}
