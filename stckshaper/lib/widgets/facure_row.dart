// facture_row.dart
import "package:flutter/material.dart";
import "package:stckshaper/models/classes/facture_module.dart";
import "package:stckshaper/style.dart";
import "package:stckshaper/widgets/info_dialog.dart";

class FactureRow extends StatelessWidget {
  final Facture facture;
  const FactureRow({super.key, required this.facture});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  width: 3,
                  color: kMainColor,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 3,
                        color: kMainColor,
                      ),
                    ),
                  ),
                  child: Text(
                    facture.id?.toString() ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Date: ${facture.date.toLocal()}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                    Text(
                      "Type: ${facture.type}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kBlackColor.withOpacity(0.4),
                      ),
                    ),
                    Text(
                      "Client ID: ${facture.clientId}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kBlackColor.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 32),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    "payment: ${facture.payment}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onMoreTap(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: kMainColor,
                  ),
                  child: const Text(
                    "More..",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onMoreTap(BuildContext context) {
    // Additional logic for handling more tap
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FactureInfoDialog(facture: facture);
      },
    );
  }
}
