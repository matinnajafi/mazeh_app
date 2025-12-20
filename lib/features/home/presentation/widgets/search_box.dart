import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onFilterTap;

  const SearchBox({super.key, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: Image.asset('images/search_icon.png'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: const TextStyle(fontFamily: 'CSB', fontSize: 14),
                  onChanged: (value) {
                    // Search logic
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'جستجوی دستور غذا ...',
                    hintStyle: TextStyle(
                      fontFamily: 'CSB',
                      color: Colors.grey.shade400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onFilterTap, //callback
                child: SizedBox(
                  height: 25,
                  child: Image.asset('images/filter_icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
