import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/category_module.dart';
import 'package:stckshaper/widgets/category_row.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          categories.length,
          (i) => CategoryRow(
            category: categories[i],
          ),
        ),
    );
  }
}
