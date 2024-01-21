import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/clientmodul.dart';

class InfoDialog extends StatelessWidget {
  final Client client;

  const InfoDialog({super.key, required this.client});

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
