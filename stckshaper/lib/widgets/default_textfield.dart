import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.label,
    this.initialText,
  });

  final TextEditingController controller;
  final String label;
  final String? initialText;

  @override
  Widget build(BuildContext context) {
    if (initialText != null) {
      controller.text = initialText!;
    }
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ProductFormDialog extends StatelessWidget {
  const ProductFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Product'),
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Name:'),
          Text('Reference:'),
          Text('BarCode:'),
          Text('In stock:'),
          Text('Buying Price:'),
          Text('Selling Price:'),
          Text('Group Id:'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(
            'Close',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
