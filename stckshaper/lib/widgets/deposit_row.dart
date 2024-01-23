import "package:flutter/material.dart";
import "package:stckshaper/style.dart";

import '../models/classes/deposit_module.dart';

class DepositRow extends StatefulWidget {
  const DepositRow({super.key, required this.deposit});
  final Deposit deposit;

  @override
  State<DepositRow> createState() => _DepositRowState();
}

class _DepositRowState extends State<DepositRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: kMainColorDarker,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 3,
                  color: kSecondaryColor,
                ),
              ),
            ),
            child: Text(
              "${widget.deposit.id}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.deposit.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.white,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: kMainColor,
              elevation: 0,
              fixedSize: const Size(50, 50),
            ),
            icon: const Icon(
              Icons.edit_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.white,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: const Color.fromARGB(255, 187, 19, 16),
              elevation: 0,
              fixedSize: const Size(50, 50),
            ),
            icon: const Icon(
              Icons.delete_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
