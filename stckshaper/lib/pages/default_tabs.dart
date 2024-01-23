import "package:flutter/material.dart";
import "package:stckshaper/widgets/forms_dialog.dart";

import "../style.dart";

class DefaultController extends StatefulWidget {
  const DefaultController({
    super.key,
    required this.tabsNum,
    required this.tabsLabels,
    required this.tabs,
    required this.refreshes,
  });

  final int tabsNum;
  final List<String> tabsLabels;
  final List<Widget> tabs;
  final List<Function> refreshes;

  @override
  State<DefaultController> createState() => _DefaultControllerState();
}

class _DefaultControllerState extends State<DefaultController>
    with TickerProviderStateMixin {
  late TabController tabController;

  void refresh(int tabIndex) {
    widget.refreshes[tabIndex]();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

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
                    onPressed: () async {
                      if (tabController.index == 0) {
                        await showDialog(
                          context: context,
                          builder: (context) => const ProductFormDialog(),
                        );
                      } else if (tabController.index == 1) {
                        await showDialog(
                          context: context,
                          builder: (context) => const ClientFormDialog(),
                        );
                      } else if (tabController.index == 2) {
                        await showDialog(
                          context: context,
                          builder: (context) => const CategoryFormDialog(),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (context) => const DepositFormDialog(),
                        );
                      }
                      refresh(tabController.index);
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
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.all(0),
                  tabs: List.generate(
                    widget.tabsLabels.length,
                    (index) => Text(widget.tabsLabels[index]),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: widget.tabs,
          ),
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
    return IconButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),),
        ),
        elevation: 0,
      ),
      icon: Container(
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
              child: const FittedBox(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            FittedBox(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
