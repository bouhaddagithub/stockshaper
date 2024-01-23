import "package:flutter/material.dart";
import "package:stckshaper/style.dart";

class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
              "Category Name",
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
