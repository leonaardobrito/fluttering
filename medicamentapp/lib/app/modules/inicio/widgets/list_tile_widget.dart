import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item_model.dart';

class ListTileWidget extends StatelessWidget {
  final MenuItem menuItem;
  final double fontSize;

  const ListTileWidget({required this.menuItem, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: ListTile(
        leading: SvgPicture.asset(
          menuItem.svgPath ?? '',
          height: 40,
          color: const Color.fromRGBO(26, 157, 213, 1),
        ),
        title: Text(
          menuItem.title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(28, 60, 80, 1),
          ),
        ),
        subtitle: Text(
          menuItem.subtitle,
          style: TextStyle(fontSize: fontSize * 0.8, color: Colors.grey),
        ),
      ),
    );
  }
}
