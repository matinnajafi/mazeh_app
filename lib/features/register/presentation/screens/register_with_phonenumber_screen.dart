import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterWithPhoneNumberScreen extends StatelessWidget {
  const RegisterWithPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استفاده از SafeArea برای جلوگیری از تداخل با ناچ گوشی
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // دکمه بازگشت ظریف
              GestureDetector(
                onTap: () => context.go('/register'),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // تیتر صفحه
              const Text(
                'خوش آمدید! 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'برای شروع، شماره موبایل خود را وارد کنید.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              // فیلد ورود شماره موبایل
              TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18, letterSpacing: 2),
                decoration: InputDecoration(
                  hintText: '0912 345 6789',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    letterSpacing: 2,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // دکمه ادامه
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // مسیر بعدی برای ورود ایمیل یا تایید کد
                    context.push('/register-email');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'ادامه',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const Spacer(),

              // بخش فوتر (اختیاری)
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'قوانین و مقررات را می‌پذیرم',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
