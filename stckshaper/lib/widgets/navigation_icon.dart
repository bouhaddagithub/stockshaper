import 'package:flutter/material.dart';

import '../style.dart';

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({
    super.key,
    required this.selected,
    required this.index,
    required this.function,
    required this.selectedIcon,
    required this.unselectedIcon,
  });

  final int selected;
  final int index;
  final IconData selectedIcon, unselectedIcon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width-20)/4,
        height: 50,
        child: Container(
          width: 50,
          height: 40,
          decoration: selected == index
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 15,
                      color: kMainColor,
                    ),
                  ],
                )
              : null,
          child: selected == index
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selectedIcon,
                      size: 28,
                      color: kWhiteColor,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 3,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: kWhiteColor,
                      ),
                    )
                  ],
                )
              : Icon(
                  unselectedIcon,
                  color: kWhiteColor,
                ),
        ),
      ),
    );
  }
}
