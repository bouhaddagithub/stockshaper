import "package:flutter/material.dart";
import "package:stckshaper/widgets/forms_dialog.dart";

import "../style.dart";

class DefaultController extends StatefulWidget {
  const DefaultController(
      {super.key,
      required this.tabsNum,
      required this.tabsLabels,
      required this.tabs});

  final int tabsNum;
  final List<String> tabsLabels;
  final List<Widget> tabs;

  @override
  State<DefaultController> createState() => _DefaultControllerState();
}

class _DefaultControllerState extends State<DefaultController> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabsNum,
      initialIndex: 0,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, inScroll) {
            return [
              SliverAppBar(
                toolbarHeight: 50,
                leadingWidth: MediaQuery.sizeOf(context).width / 2.5,
                leading: const MyTile(
                  title: "Admin",
                  subTitle: "Admin",
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      if (selectedTab == 0) {
                        showDialog(
                          context: context,
                          builder: (context) => const ProductFormDialog(),
                        );
                      } else if (selectedTab == 1) {
                        showDialog(
                          context: context,
                          builder: (context) => const ClientFormDialog(),
                        );
                      } else if (selectedTab == 2) {
                        showDialog(
                          context: context,
                          builder: (context) => const CategoryFormDialog(),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => const DepositFormDialog(),
                        );
                      }
                    },
                    iconSize: 32,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fixedSize: const Size(50, 50),
                    ),
                    icon: Icon(
                      Icons.add_rounded,
                      color: kMainColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(12),
                    icon: Image.asset(
                      "assets/icons/logout.png",
                      color: kSecondaryColor.withOpacity(0.8),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 40,
                  //     height: 40,
                  //     margin: const EdgeInsets.only(right: 10),
                  //     padding: const EdgeInsets.all(10),
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       // color: kMainColor,
                  //     ),
                  //     child: Image.asset(
                  //       "assets/icons/logout.png",
                  //       color: kSecondaryColor,
                  //     ),
                  //   ),
                  // ),
                ],
                floating: true,
                snap: true,
                pinned: true,
                bottom: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.all(0),
                  onTap: (value) {
                    selectedTab = value;
                  },
                  tabs: List.generate(
                    widget.tabsLabels.length,
                    (index) => Text(widget.tabsLabels[index]),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: widget.tabs),
        ),
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  const MyTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(20),
      ),
      splashColor: kBlackColor.withOpacity(0.2),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: kMainColor,
              child: const Text(
                "A",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
