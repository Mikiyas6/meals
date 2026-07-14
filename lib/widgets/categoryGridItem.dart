import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: category.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        ),
      ),
      child: Text(category.title),
    );
  }
}
