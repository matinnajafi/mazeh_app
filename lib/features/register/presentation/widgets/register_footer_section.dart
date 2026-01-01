import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class RegisterFooterSection extends StatelessWidget {
  const RegisterFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        color: AppColor.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Image.asset('images/hand.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      ' خوش اومدی',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'CSB',
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      'به ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'CSB',
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 2),

            // Subtexts
            Text(
              'محبوب‌ترین برنامه دستور آشپزی کشور!',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontFamily: 'CSB',
                fontSize: 14,
              ),
            ),
            Text(
              'با بیش از یک میلیون کاربر فعال',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontFamily: 'CSB',
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 14),

            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.1),
              indent: 18,
              endIndent: 18,
            ),

            const SizedBox(height: 16),

            // Mobile Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: AppColor.backgroundColor,
                  side: BorderSide(color: Colors.grey.withOpacity(0.25)),
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(
                    AppColor.red.withOpacity(0.02),
                  ), // splash color
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 34,
                      width: 34,
                      child: Image.asset('images/mobile.png'),
                    ),
                    const Text(
                      'با شماره موبایل وارد شوید',
                      style: TextStyle(color: Colors.black, fontFamily: 'CSB'),
                    ),
                    const SizedBox(width: 32, height: 32),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Google Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: AppColor.backgroundColor,
                  side: BorderSide(color: Colors.grey.withOpacity(0.25)),
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(
                    AppColor.red.withOpacity(0.02),
                  ), // splash color
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 28,
                      width: 28,
                      child: Image.asset('images/icon_google.png'),
                    ),
                    const Text(
                      'با حساب گوگل وارد شوید',
                      style: TextStyle(color: Colors.black, fontFamily: 'CSB'),
                    ),
                    const SizedBox(width: 32, height: 32),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Email Divider
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.1),
                    indent: 18,
                    endIndent: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'با ایمیل وارد شوید',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontFamily: 'CM',
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.1),
                    indent: 2,
                    endIndent: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Email Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(
                    AppColor.red.withOpacity(0.02),
                  ), // splash color
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('images/mail.png'),
                    ),
                    const SizedBox(width: 6),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'با ایمیل وارد شوید',
                        style: TextStyle(color: Colors.white, fontFamily: 'CM'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Already have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'وارد شوید',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'CSB',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'حساب دارید؟',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontFamily: 'CM',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
