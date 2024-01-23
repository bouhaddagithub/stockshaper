import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/widgets/deposit_row.dart';

class DepositsWidget extends StatelessWidget {
  const DepositsWidget({
    super.key,
    required this.deposits,
  });

  final List<Deposit> deposits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        deposits.length,
        (i) => DepositRow(
          deposit: deposits[i],
        ),
      ),
    );
  }
}
