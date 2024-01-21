import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/clientmodul.dart';

import '../models/classes/productmodul.dart';

class ClientInfoDialog extends StatelessWidget {
  final Client client;
  const ClientInfoDialog({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Client Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Name: ${client.name}'),
          Text('Phone Number: ${client.phoneNumber}'),
          Text('Address: ${client.address}'),
          Text('Total Sold: ${client.soldTotal}'),
          Text('Remaining Amount: ${client.remainingAmount}'),
          Text('Paid Amount: ${client.paidAmount}'),
          Text('Credit Amount: ${client.creditAmount}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class ProductInfoDialog extends StatelessWidget {
  final Product product;
  const ProductInfoDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Product Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Name: ${product.name}'),
          Text('Reference: ${product.reference}'),
          Text('BarCode: ${product.barCode}'),
          Text('In stock: ${product.stock}'),
          Text('Buying Price: ${product.buyingPrice}'),
          Text('Selling Price: ${product.sellingPrice}'),
          Text('Group Id: ${product.groupId}'),
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
