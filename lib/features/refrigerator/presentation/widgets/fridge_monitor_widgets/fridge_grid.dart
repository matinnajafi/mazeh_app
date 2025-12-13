import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FridgeGrid extends StatelessWidget {
  const FridgeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: [
        // Left tall rectangle (height 2)
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: _buildTile(1),
        ),

        // Right top rectangle
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildTile(2),
        ),

        // Right bottom rectangle
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildTile(3),
        ),

        // Horizontal rectangle (wide)
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: _buildTile(4),
        ),

        // Square (1:1)
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildTile(5),
        ),

        // Square (1:1)
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildTile(7),
        ),
      ],
    );
  }

  Widget _buildTile(int gridNumber) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0)),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset('images/banner$gridNumber.png'),
      ),
    );
  }
}
