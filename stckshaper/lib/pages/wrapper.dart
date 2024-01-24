import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stckshaper/models/provider_classes.dart';
import 'package:stckshaper/pages/administration.dart';
import 'package:stckshaper/pages/inventory.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavIndex>(
      builder: (context, value, child) {
        if (value.tabIndex == 0) {
          return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: const Text("Value is 00"),
          );
        } else if (value.tabIndex == 1) {
          return Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: const Text("Value is 01"),
          );
        } else if (value.tabIndex == 2) {
          return const Inventory();
        } else {
          return const Administration();
        }
      },
    );
  }
}
