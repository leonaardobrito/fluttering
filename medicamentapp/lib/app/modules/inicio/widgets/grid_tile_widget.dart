import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item_model.dart';

class GridTileWidget extends StatelessWidget {
  final MenuItem menuItem;
  final double fontSize;

  const GridTileWidget(
      {super.key, required this.menuItem, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            menuItem.svgPath ?? '',
            height: 32,
            color: const Color.fromRGBO(26, 157, 213, 1),
          ),
          const SizedBox(height: 8),
          Text(
            menuItem.title,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(28, 60, 80, 1)),
          ),
          Center(
            child: Text(
              menuItem.subtitle,
              style: TextStyle(fontSize: fontSize * 0.8, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
