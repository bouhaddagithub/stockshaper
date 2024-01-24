import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/category_module.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/style.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({
    super.key,
    this.categories,
    this.deposits,
    required this.getId,
  });
  final List<Category>? categories;
  final List<Deposit>? deposits;
  final Function(int selectedItemId, bool isForCategory) getId;

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  late String selectedItem;
  late List<String> usedItems;
  late bool isForCategories;

  @override
  void initState() {
    super.initState();
    if (widget.categories != null) {
      isForCategories = true;
      usedItems = List.generate(
        widget.categories!.length,
        (index) =>
            "${widget.categories?[index].id}: ${widget.categories?[index].name}",
      );
    } else {
      isForCategories = false;
      usedItems = List.generate(
        widget.deposits!.length,
        (index) =>
            "${widget.deposits?[index].id}: ${widget.deposits?[index].name}",
      );
    }
    selectedItem = usedItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField<String>(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: kBlackColor,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          fillColor: kMainColor.withOpacity(0.3),
          contentPadding: const EdgeInsets.only(left: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: kMainColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: kMainColor,
            ),
          ),
        ),
        value: selectedItem,
        items: usedItems
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e, overflow: TextOverflow.ellipsis,),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          selectedItem = value ?? "";
          int selectedIndex = usedItems.indexOf(selectedItem);
          widget.getId(
            (isForCategories
                    ? widget.categories![selectedIndex].id
                    : widget.deposits![selectedIndex].id) ??
                0,
            isForCategories,
          );
        },
      ),
    );
  }
}
