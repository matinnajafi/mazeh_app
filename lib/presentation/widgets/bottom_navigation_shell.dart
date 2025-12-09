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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: calculateSelectedIndex(location),
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColor.red,
        unselectedItemColor: AppColor.greytextColor,
        backgroundColor: Colors.white,
        useLegacyColorScheme: true,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontFamily: 'CSB'),
        unselectedLabelStyle: TextStyle(fontFamily: 'CM'),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_rounded),
            label: 'ذخیره شده‌ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'اضافه کردن',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'یخچال من',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'خانه',
          ),
        ],
      ),
    );
  }
}

int calculateSelectedIndex(String location) {
  if (location.startsWith('/profile')) return 0;
  if (location.startsWith('/save')) return 1;
  if (location.startsWith('/add')) return 2;
  if (location.startsWith('/refrigerator')) return 3;
  if (location.startsWith('/home')) return 4;
  return 4;
}
