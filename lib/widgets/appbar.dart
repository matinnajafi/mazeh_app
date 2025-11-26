import 'package:flutter/material.dart';

class AppbarLeading extends StatelessWidget {
  const AppbarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.notifications_none,
                color: Colors.grey.shade800,
                size: 28,
              ),
            ),
          ),
          const Spacer(),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('درود', style: TextStyle(fontSize: 18, fontFamily: 'CSB')),
              Text(
                '!متین جان',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'CSB',
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          ClipOval(
            child: Image.asset(
              'images/user.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class FadingTextAppbar extends StatelessWidget {
  const FadingTextAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textAlign: TextAlign.right,
            'امروز دوست داری چی بپزی؟',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w400,
              fontFamily: 'CM',
            ),
          ),
        ],
      ),
    );
  }
}
