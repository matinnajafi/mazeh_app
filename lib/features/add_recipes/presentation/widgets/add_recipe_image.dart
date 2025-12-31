import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

// Image List
class RecipeImageList extends StatelessWidget {
  const RecipeImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.1),
                        image: DecorationImage(
                          image: AssetImage('images/pasta${index + 1}.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.red,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Image field
class AddRecipeImageField extends StatelessWidget {
  const AddRecipeImageField({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(6),
          dashPattern: const [8, 4],
          color: Colors.grey.withOpacity(0.1),
          strokeWidth: 2,
        ),
        child: Container(
          height: 180,
          width: size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                'لطفا تصویر غذای خود را بارگذاری کنید',
                style: TextStyle(
                  fontFamily: 'CM',
                  fontSize: 14,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(150, 60),
                  backgroundColor: AppColor.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'بارگذاری تصویر',
                      style: TextStyle(
                        fontFamily: 'CM',
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.upload_file_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Image title
class AddRecipeImageTitle extends StatelessWidget {
  const AddRecipeImageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            'افزودن عکس غذا',
            style: TextStyle(fontFamily: 'CSB', fontSize: 14),
          ),
          SizedBox(width: 6),
          Icon(Icons.camera_alt_outlined, size: 20, color: AppColor.red),
        ],
      ),
    );
  }
}
