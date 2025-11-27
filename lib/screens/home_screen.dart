import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:mazeh_app/constants/app_color.dart';
import 'package:mazeh_app/widgets/appbar.dart';
import 'package:mazeh_app/widgets/banner_slider.dart';
import 'package:mazeh_app/widgets/category_widget.dart';
import 'package:mazeh_app/widgets/recipe_card_widget.dart';
import 'package:mazeh_app/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: FadeScrollAppBar(
        scrollController: _scrollController,
        appBarLeading: const AppbarLeading(),
        appBarLeadingWidth: MediaQuery.of(context).size.width,
        appBarForegroundColor: Colors.white,
        pinned: true,
        fadeOffset: 110,
        expandedHeight: 280,
        backgroundColor: AppColor.red,
        fadeWidget: const FadingTextAppbar(),
        bottomWidgetHeight: 76,
        bottomWidget: const SearchBox(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Here goes the slivers(banners, lists, grids and etc)
            SliverPadding(padding: EdgeInsets.only(top: 16)),
            SliverToBoxAdapter(child: const BannerSlider()),
            SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(child: const CategoryTitle()),
            SliverToBoxAdapter(child: const CategorySelector()),
            SliverPadding(padding: EdgeInsets.only(top: 14)),
            SliverToBoxAdapter(child: const RecipeListTitle()),
            SliverToBoxAdapter(child: const RecipeList()),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(8),
                height: 100,
                color: Colors.teal,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(8),
                height: 100,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return RecipeCardWidget();
          },
        ),
      ),
    );
  }
}
