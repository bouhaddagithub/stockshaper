import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/models/classes/facture_module.dart';
import 'package:stckshaper/widgets/deposit_row.dart';
import 'package:stckshaper/widgets/facure_row.dart';

class FactureWidget extends StatelessWidget {
  const FactureWidget({
    super.key,
    required this.factures,
  });

  final List<Facture> factures;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        factures.length,
        (i) => FactureRow(
          facture: factures[i],
        ),
      ),
    );
  }
}
