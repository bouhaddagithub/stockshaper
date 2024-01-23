import "package:flutter/material.dart";
import "package:stckshaper/style.dart";

class DepositRow extends StatefulWidget {
  const DepositRow({super.key});

  @override
  State<DepositRow> createState() => _DepositRowState();
}

class _DepositRowState extends State<DepositRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: kMainColorDarker,
        // border: Border.all(
        //   color: kMainColor,
        //   width: 2,
        // ),
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
            child: const Text(
              "01",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              "Deposit Name",
              style: TextStyle(
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
