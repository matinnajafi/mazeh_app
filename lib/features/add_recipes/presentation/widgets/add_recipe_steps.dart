import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/add_steps_dialog.dart';

class AddRecipeSteps extends StatefulWidget {
  const AddRecipeSteps({super.key});

  @override
  State<AddRecipeSteps> createState() => _AddRecipeStepsState();
}

class _AddRecipeStepsState extends State<AddRecipeSteps> {
  final List<Map<String, String>> steps = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double dynamicHeight = 160 + (steps.length * 65);
        if (dynamicHeight > 500) dynamicHeight = 500;
        if (dynamicHeight < 160) dynamicHeight = 160;

        return Container(
          height: dynamicHeight,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // header
              Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                  bottom: 14.0,
                  right: 24.0,
                  left: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(36, 36),
                        shape: const CircleBorder(),
                        backgroundColor: AppColor.red,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AddStepsDialog(
                                onSubmit: (title, desc) {
                                  setState(() {
                                    steps.add({'title': title, 'desc': desc});
                                  });
                                },
                              ),
                        );
                      },
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    const Spacer(),
                    const Text(
                      'مراحل تهیه غذا',
                      style: TextStyle(fontFamily: 'CSB', fontSize: 14),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.lunch_dining,
                      size: 18,
                      color: AppColor.red,
                    ),
                  ],
                ),
              ),

              // list
              if (steps.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    itemCount: steps.length,
                    itemBuilder: (_, index) {
                      final step = steps[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        step['title']!,
                                        style: const TextStyle(
                                          fontFamily: 'CM',
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'مرحله ${index + 1}',
                                        style: const TextStyle(
                                          fontFamily: 'CB',
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    step['desc']!,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      fontFamily: 'CM',
                                      fontSize: 12,
                                      height: 1.6,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Icon(
                                Icons.first_page_rounded,
                                size: 22,
                                color: AppColor.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              // final button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ثبت و اشتراک‌گذاری',
                      style: TextStyle(
                        fontFamily: 'CB',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
