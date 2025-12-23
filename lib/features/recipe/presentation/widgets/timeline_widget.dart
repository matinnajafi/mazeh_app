import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:timelines_plus/timelines_plus.dart';

class InteractiveTimeline extends StatefulWidget {
  const InteractiveTimeline({super.key});

  @override
  State<InteractiveTimeline> createState() => _InteractiveTimelineState();
}

class _InteractiveTimelineState extends State<InteractiveTimeline> {
  int selectedStep = 0;

  final List<String> steps = const [
    'قابلمه را پر از آب کنید و بگذارید خوب بجوشد',
    'وقتی آب به جوش رسید پاستا را اضافه کنید و اجازه دهید کاملاً بپزد و در همین مرحله می‌توانید کمی نمک و حتی چند قطره روغن هم اضافه کنید تا پاستاها به هم نچسبند و بافتشان بهتر بماند و فقط کافی است زمان پخت را طبق نوع پاستا تنظیم کنید تا نه خیلی نرم شود و نه بیش از حد سفت بماند',
    'پاستا را آبکش کنید و اگر دوست داشتید کمی کره یا روغن زیتون روی آن بریزید',
    'سس دلخواهتان را آماده کنید مثل آلفردو یا پستو یا یک سس گوجه‌ای ساده و بعد پاستا را با سس مخلوط کنید و چند دقیقه روی حرارت ملایم قرار دهید تا طعم‌ها خوب با هم ترکیب شوند و آماده سرو شود',
  ];

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).dividerColor;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24, right: 28),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 1.0,
          connectorTheme: ConnectorThemeData(thickness: 3.0),
          indicatorTheme: IndicatorThemeData(size: 16.0),
        ),
        builder: TimelineTileBuilder.connected(
          itemCount: steps.length,
          contentsAlign: ContentsAlign.reverse,

          // CONNECTOR
          connectorBuilder: (_, index, __) {
            final isActive = index < selectedStep;

            return GestureDetector(
              onTap: () => setState(() => selectedStep = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child:
                    isActive
                        ? const SolidLineConnector(color: AppColor.red)
                        : DashedLineConnector(
                          color: dividerColor,
                          indent: 3.5,
                          thickness: 3.0,
                          gap: 4.5,
                        ),
              ),
            );
          },

          // INDICATOR
          indicatorBuilder: (_, index) {
            final isActive = index < selectedStep;
            final isCurrent = index == selectedStep;

            return GestureDetector(
              onTap: () => setState(() => selectedStep = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      isCurrent
                          ? Border.all(color: AppColor.red, width: 2)
                          : null,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: isCurrent ? 12 : 16,
                  height: isCurrent ? 12 : 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isActive || isCurrent
                            ? AppColor.red
                            : Colors.transparent,
                    border: Border.all(
                      color:
                          isActive || isCurrent ? AppColor.red : dividerColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
            );
          },

          // CONTENT
          contentsBuilder: (context, index) {
            final isCurrent = index == selectedStep;

            return GestureDetector(
              onTap: () => setState(() => selectedStep = index),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 24),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        isCurrent
                            ? AppColor.red.withOpacity(0.05)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مرحله ${index + 1}',
                        style: const TextStyle(
                          fontFamily: 'CB',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        steps[index],
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'CM',
                          fontSize: 14,
                          color:
                              isCurrent
                                  ? Colors.grey[700]
                                  : AppColor.greytextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
