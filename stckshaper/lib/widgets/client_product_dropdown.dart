import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/client_module.dart';
import 'package:stckshaper/models/classes/product_module.dart';
import 'package:stckshaper/style.dart';

class ClientDropdown extends StatefulWidget {
  const ClientDropdown({
    super.key,
    required this.clients,
    required this.getId,
  });

  final List<Client>? clients;
  final Function(int selectedItemId) getId;

  @override
  State<ClientDropdown> createState() => _ClientDropdownState();
}

class _ClientDropdownState extends State<ClientDropdown> {
  late String selectedItem;
  late List<String> usedItems;

  @override
  void initState() {
    super.initState();
    if (widget.clients != null && widget.clients!.isNotEmpty) {
      usedItems = List.generate(
        widget.clients!.length,
        (index) =>
            "${widget.clients?[index].id}: ${widget.clients?[index].name}",
      );
      selectedItem = usedItems.isNotEmpty ? usedItems[0] : "";
    } else {
      usedItems = [];
      selectedItem = "";
    }
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
                child: Text(
                  e,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          selectedItem = value ?? "";
          int selectedIndex = usedItems.indexOf(selectedItem);
          widget.getId(widget.clients![selectedIndex].id ?? 0);
        },
      ),
    );
  }
}

class ProductDropdown extends StatefulWidget {
  const ProductDropdown({
    super.key,
    required this.products,
    required this.getId,
  });

  final List<Product>? products;
  final Function(int selectedItemId) getId;

  @override
  @override
  State<ProductDropdown> createState() => _ProductDropdownState();
}

class _ProductDropdownState extends State<ProductDropdown> {
  late String selectedItem;
  late List<String> usedItems;

  @override
  void initState() {
    super.initState();
    if (widget.products != null && widget.products!.isNotEmpty) {
      usedItems = List.generate(
        widget.products!.length,
        (index) =>
            "${widget.products?[index].id}: ${widget.products?[index].name}",
      );
      selectedItem = usedItems.isNotEmpty ? usedItems[0] : "";
    } else {
      usedItems = [];
      selectedItem = "";
    }
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
                child: Text(
                  e,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          selectedItem = value ?? "";
          int selectedIndex = usedItems.indexOf(selectedItem);
          widget.getId(widget.products![selectedIndex].id ?? 0);
        },
      ),
    );
  }
}
