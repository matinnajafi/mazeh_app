import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/home/presentation/widgets/search_box.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/ingredient_card.dart';
import 'package:mazeh_app/shared/widgets/tile_divider.dart';

class AddIngredientsBox extends StatelessWidget {
  const AddIngredientsBox({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // title
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'مواد لازم',
                  style: TextStyle(fontFamily: 'CSB', fontSize: 14),
                ),
                SizedBox(width: 6),
                Icon(Icons.lunch_dining, size: 18, color: AppColor.red),
              ],
            ),
          ),

          // searchBox
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchBox(
              onFilterTap: () {},
              hintText: 'جستجوی مواد غذایی ...',
            ),
          ),

          const SizedBox(height: 12),

          // hoizontal ingredient list
          SizedBox(
            height: 110,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: IngredientItem(),
                    );
                  },
                ),
              ),
            ),
          ),

          // selected ingredient list
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 260,
              width: size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // finish button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(20, 24),
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'ثبت',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'CM',
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // weight
                              const Text(
                                'گرم',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'CM',
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                '200',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'CM',
                                ),
                              ),

                              const Spacer(),

                              // name
                              const Text(
                                'گوشت',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'CM',
                                ),
                              ),
                              Text(
                                '.${index + 1}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'CM',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const TileDivider(thickness: 0.75),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
