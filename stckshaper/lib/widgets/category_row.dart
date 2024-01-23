import "package:flutter/material.dart";
import "package:stckshaper/style.dart";

import '../models/classes/category_module.dart';

class CategoryRow extends StatefulWidget {
  final Category category;
  const CategoryRow({super.key, required this.category});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: kSecondaryColor,
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
                  color: kMainColor,
                ),
              ),
            ),
            child: Text(
              "${widget.category.id}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.category.name,
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
              backgroundColor: kSecondaryColorLighter,
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
