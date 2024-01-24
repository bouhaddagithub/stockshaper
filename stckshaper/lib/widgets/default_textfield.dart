import 'package:flutter/material.dart';
import 'package:stckshaper/style.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.label,
    this.initialText,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final String label;
  final String? initialText;
  final bool isObscure;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.isObscure;
    if (widget.initialText != null) {
      widget.controller.text = widget.initialText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      decoration: InputDecoration(
        label: Text(widget.label),
        suffixIcon: widget.isObscure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(
                  obscure ? Icons.remove_red_eye : Icons.visibility_off_rounded,
                  color: kSecondaryColor,
                ),
              )
            : const SizedBox(),
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
