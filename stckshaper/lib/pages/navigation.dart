import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stckshaper/models/provider_classes.dart';
import 'package:stckshaper/pages/wrapper.dart';
import 'package:stckshaper/widgets/navigation_icon.dart';

import '../style.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Wrapper(),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.sizeOf(context).width - 20,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: kBlackColor.withOpacity(0.4),
                  )
                ],
              ),
              child: Consumer<NavIndex>(
                builder: (BuildContext context, NavIndex value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationIcon(
                        selected: selected,
                        selectedIcon: Icons.home_rounded,
                        unselectedIcon: Icons.home_outlined,
                        index: 0,
                        function: () {
                          selected = 0;
                          value.changeIndex(0);
                        },
                      ),
                      NavigationIcon(
                        selected: selected,
                        selectedIcon: Icons.shopping_cart_rounded,
                        unselectedIcon: Icons.shopping_cart_outlined,
                        index: 1,
                        function: () {
                          selected = 1;
                          value.changeIndex(1);
                        },
                      ),
                      NavigationIcon(
                        selected: selected,
                        selectedIcon: Icons.inventory_2_rounded,
                        unselectedIcon: Icons.inventory_2_outlined,
                        index: 2,
                        function: () {
                          selected = 2;
                          value.changeIndex(2);
                        },
                      ),
                      NavigationIcon(
                        selected: selected,
                        selectedIcon: Icons.manage_accounts_rounded,
                        unselectedIcon: Icons.manage_accounts_outlined,
                        index: 3,
                        function: () {
                          selected = 3;
                          value.changeIndex(3);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
