import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/onboarding/presentation/widgets/dynamic_appbar_clipper.dart';
import 'package:mazeh_app/features/onboarding/presentation/widgets/intro_screen_contents.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double page = 0.0;

  static const radii = [
    [130.0, 10.0],
    [100.0, 40.0],
    [70.0, 70.0],
    [40.0, 100.0],
    [10.0, 130.0],
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() => page = _pageController.page ?? 0.0);
    });
  }

  double lerp(double a, double b) => a + (b - a) * (page - page.floor());

  List<double> getInterpolatedRadii() {
    final current = page.floor();
    final next = (current + 1).clamp(0, radii.length - 1);

    return [
      lerp(radii[current][0], radii[next][0]),
      lerp(radii[current][1], radii[next][1]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentRadii = getInterpolatedRadii();
    final size = MediaQuery.of(context).size;

    final bool isLastPage = page.round() == 4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _pageController,
              builder: (_, __) {
                return ClipPath(
                  clipper: DynamicAppBarClipper(
                    bottomLeft: currentRadii[0],
                    bottomRight: currentRadii[1],
                  ),
                  child: Container(
                    height: size.height * 0.55,
                    width: double.infinity,
                    color: const Color.fromARGB(232, 143, 17, 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                  ),
                );
              },
            ),

            // pageview for intro screens
            PageView(
              controller: _pageController,
              children: const [
                IntroScreenContents(
                  imagePath: 'intro1.png',
                  title: 'دنیایی از طعم‌های تازه',
                  subtitle:
                      'با مجموعه‌ای از بهترین و متنوع‌ترین دستورهای آشپزی، هر روز یک تجربه‌ی خوشمزه بساز.',
                ),
                IntroScreenContents(
                  imagePath: 'intro2.png',
                  title: 'آشپزی آسان برای همه',
                  subtitle:
                      'دستورهای مرحله‌به‌مرحله، دقیق و قابل فهم؛ حتی اگر تازه‌کار باشید، مثل یک سرآشپز می‌درخشید.',
                ),
                IntroScreenContents(
                  imagePath: 'intro3.png',
                  title: 'مواد لازم همیشه دمِ دست',
                  subtitle:
                      'لیست خرید هوشمند به شما کمک می‌کند هیچ‌وقت چیزی را فراموش نکنید و همیشه آماده‌ی آشپزی باشید.',
                ),
                IntroScreenContents(
                  imagePath: 'intro4.png',
                  title: 'غذاهای سالم، زندگی سالم',
                  subtitle:
                      'با دستورهای کم‌کالری، سالم و مقوی، سبک زندگی بهتر و انرژی بیشتری را تجربه کنید.',
                ),
                IntroScreenContents(
                  imagePath: 'intro5.png',
                  title: 'ذخیره و اشتراک‌گذاری',
                  subtitle:
                      'غذاهای موردعلاقه‌تان را ذخیره کنید و با دوستان و خانواده به اشتراک بگذارید.',
                ),
              ],
            ),

            // close button
            Positioned(
              top: 44,
              right: 24,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.close_rounded, color: Colors.white),
              ),
            ),

            Positioned(
              bottom: 50,
              left: 34,
              right: 34,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 5,
                    effect: WormEffect(
                      spacing: 4,
                      radius: 12,
                      dotWidth: 9,
                      dotHeight: 9,
                      paintStyle: PaintingStyle.fill,
                      dotColor: const Color.fromARGB(37, 143, 17, 15),
                      activeDotColor: AppColor.red,
                    ),
                  ),
                  const Spacer(),

                  // button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 45),
                      backgroundColor: AppColor.red,
                      overlayColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (isLastPage) {
                        // go to register
                        context.go('/register');
                      } else {
                        // go to next page
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7, right: 8),
                          child: Text(
                            isLastPage ? 'پس بزن بریم' : 'ورق بزن',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'CM',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Image.asset('images/arrow_back.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
