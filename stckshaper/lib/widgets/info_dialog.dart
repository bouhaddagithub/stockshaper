import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/client_module.dart';
import 'package:stckshaper/models/classes/facture_module.dart';

import '../models/classes/product_module.dart';

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

class FactureInfoDialog extends StatelessWidget {
  final Facture facture;
  const FactureInfoDialog({super.key, required this.facture});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Facture Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ID: ${facture.id}'),
          Text('Date: ${facture.date.toLocal()}'),
          Text(
              'Update Date: ${facture.updateDate?.toLocal() ?? "Not Updated"}'),
          Text(
              'Update Time: ${facture.updateTime?.toLocal() ?? "Not Updated"}'),
          Text('Solde: ${facture.solde}'),
          Text('Reste: ${facture.reste}'),
          Text('Payment: ${facture.payment}'),
          Text('Client ID: ${facture.clientId}'),
          Text('Seller ID: ${facture.sellerId}'),
          Text('Type: ${facture.type}'),
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
