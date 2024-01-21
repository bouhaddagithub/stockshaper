import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/clientmodul.dart';
import 'package:stckshaper/pages/default_tabs.dart';
import 'package:stckshaper/sqlite/database_connection.dart';

import '../style.dart';
import '../widgets/client_row.dart';
import '../widgets/product_row.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selected = 0;

  late List<Client> clients = [];

  @override
  void initState() {
    super.initState();
    _fetchClients();
  }

  void _fetchClients() async {
    List<Client> fetchedClients = await DatabaseHelper().getClients();
    setState(() {
      clients = fetchedClients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultController(
            tabsNum: 3,
            tabsLabels: const ["Products", "Clients", "Categories"],
            tabs: [
              Column(
                children: [
                  if (clients.isNotEmpty)
                    for (Client client in clients) ClientRow(client: client),
                  if (clients.isEmpty) ClientRow(client: Client.empty()),
                  const ProductRow(),
                ],
              ),
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.redAccent,
              ),
            ],
          ),
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
                  BoxShadow(blurRadius: 10, color: kBlackColor.withOpacity(0.4))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigationIcon(
                    selected: selected,
                    selectedIcon: Icons.home_rounded,
                    unselectedIcon: Icons.home_outlined,
                    index: 0,
                    function: () {
                      setState(() {
                        selected = 0;
                      });
                    },
                  ),
                  NavigationIcon(
                    selected: selected,
                    selectedIcon: Icons.shopping_cart_rounded,
                    unselectedIcon: Icons.shopping_cart_outlined,
                    index: 1,
                    function: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                  ),
                  NavigationIcon(
                    selected: selected,
                    selectedIcon: Icons.inventory_2_rounded,
                    unselectedIcon: Icons.inventory_2_outlined,
                    index: 2,
                    function: () {
                      setState(() {
                        selected = 2;
                      });
                    },
                  ),
                  NavigationIcon(
                    selected: selected,
                    selectedIcon: Icons.manage_accounts_rounded,
                    unselectedIcon: Icons.manage_accounts_outlined,
                    index: 3,
                    function: () {
                      setState(() {
                        selected = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    );
  }
}
