import "package:flutter/material.dart";
import "package:stckshaper/models/classes/category_module.dart";
import "package:stckshaper/models/classes/client_module.dart";
import "package:stckshaper/models/classes/deposit_module.dart";
import "package:stckshaper/models/classes/product_module.dart";
import "package:stckshaper/sqlite/database_connection.dart";
import 'package:stckshaper/widgets/appbar_tile.dart';
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
  late List<Deposit> deposits = [];
  late List<Category> categories = [];
  late List<Client> clients = [];
  late List<Product> products = [];
  late TabController tabController;

  void refresh(int tabIndex) {
    widget.refreshes[tabIndex]();
  }

  void _fetchClients() async {
    List<Client> fetchedClients = await DatabaseHelper().getClients();
    setState(() {
      clients = fetchedClients;
    });
  }

  void _fetchProducts() async {
    List<Product> fetchedProducts = await DatabaseHelper().getProducts();
    setState(() {
      products = fetchedProducts;
    });
  }

  void _fetchDeposits() async {
    List<Deposit> fetchedDeposits = await DatabaseHelper().getDeposits();
    setState(() {
      deposits = fetchedDeposits;
    });
  }

  void _fetchCategories() async {
    List<Category> fetchedCategories = await DatabaseHelper().getGroupes();
    setState(() {
      categories = fetchedCategories;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDeposits();
    _fetchCategories();
    _fetchClients();
    _fetchProducts();
    tabController = TabController(length: 5, vsync: this);
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
                          builder: (context) => ProductFormDialog(
                            categories: categories,
                            deposits: deposits,
                          ),
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
                      } else if (tabController.index == 3) {
                        await showDialog(
                          context: context,
                          builder: (context) => const DepositFormDialog(),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (context) => FactureFormDialog(
                            clients: clients,
                            products: products,
                          ),
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
