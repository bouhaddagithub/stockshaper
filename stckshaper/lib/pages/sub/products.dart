import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/product_module.dart';
import 'package:stckshaper/widgets/product_row.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        products.length,
        (i) => ProductRow(
          product: products[i],
        ),
      ),
    );
  }
}
