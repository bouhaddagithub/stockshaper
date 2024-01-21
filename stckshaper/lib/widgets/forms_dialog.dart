import "package:flutter/material.dart";
import 'package:stckshaper/style.dart';
import '../models/classes/productmodul.dart';
import 'default_texfield.dart';

class ClientFormDialog extends StatefulWidget {
  const ClientFormDialog({super.key});

  @override
  State<ClientFormDialog> createState() => _ClientFormDialogState();
}

class _ClientFormDialogState extends State<ClientFormDialog> {
  TextEditingController clientName = TextEditingController(),
      clientPhone = TextEditingController(),
      clientAddress = TextEditingController(),
      clientCreditLimit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.person_add_alt_1_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Client'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: clientName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: clientName, label: "Phone Number"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: clientName, label: "Address"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: clientName, label: "Credit Limit"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductFormDialog extends StatefulWidget {
  const ProductFormDialog({super.key});

  @override
  State<StatefulWidget> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  TextEditingController productName = TextEditingController(),
      productBarCode = TextEditingController(),
      productReference = TextEditingController(),
      productBuyingPrice = TextEditingController(),
      productSellingPrice = TextEditingController(),
      productAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.add_circle_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Product'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: productName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productReference, label: "Reference"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productBarCode, label: "BarCode"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productAmount, label: "Amount"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DefaultTextField(
                    controller: productBuyingPrice,
                    label: "Buy Price",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DefaultTextField(
                    controller: productSellingPrice,
                    label: "Sell Price",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryFormDialog extends StatefulWidget {
  const CategoryFormDialog({super.key});

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  TextEditingController categoryName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.category_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Category'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: categoryName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
class DepositFormDialog extends StatefulWidget {
  const DepositFormDialog({super.key});

  @override
  State<DepositFormDialog> createState() => _DepositFormDialogState();
}

class _DepositFormDialogState extends State<DepositFormDialog> {
  TextEditingController depositName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.category_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Category'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: depositName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
