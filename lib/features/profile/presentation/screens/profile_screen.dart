import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/profile/presentation/widgets/main_tiles_title.dart';
import 'package:mazeh_app/features/profile/presentation/widgets/row_tile.dart';
import 'package:mazeh_app/shared/widgets/group_tile_divider.dart';
import 'package:mazeh_app/shared/widgets/tile_divider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      repeat: ImageRepeat.repeat,
                      opacity: 0.8,
                      image: AssetImage('images/pattern.png'),
                    ),
                    color: Color.fromARGB(255, 135, 16, 14),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(color: AppColor.backgroundColor),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        color: Colors.white,
                        shadows: const [
                          BoxShadow(blurRadius: 54, spreadRadius: -50),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 46, bottom: 12),
                        child: Column(
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColor.red,
                                  width: 3.5,
                                ),
                              ),
                              child: Center(
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/user.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              'متین نجفی',
                              style: TextStyle(fontFamily: 'CM', fontSize: 24),
                            ),
                            const SizedBox(height: 2.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit, color: Colors.blue, size: 12),
                                Text(
                                  'ویرایش',
                                  style: TextStyle(
                                    fontFamily: 'CM',
                                    fontSize: 12,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 46),
                            const GroupTileDivider(),
                            MainTilesTitle(title: 'تعامل با مزه'),
                            RowTile(
                              title: 'مدال‌های من',
                              icon: const Icon(
                                Icons.wallet_giftcard_rounded,
                                color: AppColor.red,
                                size: 18,
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(endIndent: 40),
                            RowTile(
                              title: 'نظرهای من',
                              icon: const Icon(
                                Icons.comment_rounded,
                                color: AppColor.red,
                                size: 18,
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(endIndent: 40),
                            RowTile(
                              title: 'غذاهای اضافه‌شده',
                              icon: const Icon(
                                Icons.food_bank_rounded,
                                color: AppColor.red,
                                size: 20,
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const SizedBox(height: 10),
                            const GroupTileDivider(),
                            MainTilesTitle(title: 'مشخصات کاربری'),
                            RowTile(
                              title: 'نام کاربری',
                              arrow: const Text(
                                'متین نجفی',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'CM',
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(),
                            RowTile(
                              title: 'تاریخ تولد',
                              arrow: const Text(
                                '۱۳۸۳/۷/۳۰',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'CM',
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(),
                            RowTile(
                              title: 'جنسیت',
                              arrow: const Text(
                                'مرد',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'CM',
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(),
                            RowTile(
                              title: 'شماره تلفن همراه',
                              arrow: const Text(
                                '+۹۸ ۹۰۵ ۲۷۱ ۶۰۶۷',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'CM',
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const SizedBox(height: 10),
                            const GroupTileDivider(),
                            MainTilesTitle(title: 'وضعیت حساب'),
                            RowTile(
                              title: 'دستگاه‌های فعال',
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                            const TileDivider(),
                            RowTile(
                              title: 'خروج از حساب کاربری',
                              arrow: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(3.1416),
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.redAccent,
                                  size: 18,
                                ),
                              ),
                              onTap: () {
                                // Navigate or do something
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
