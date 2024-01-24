import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/category_module.dart';
import 'package:stckshaper/models/classes/client_module.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/models/classes/product_module.dart';
import 'package:stckshaper/pages/default_tabs.dart';
import 'package:stckshaper/pages/sub/categories.dart';
import 'package:stckshaper/pages/sub/clients.dart';
import 'package:stckshaper/pages/sub/deposits.dart';
import 'package:stckshaper/pages/sub/products.dart';
import 'package:stckshaper/sqlite/database_connection.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  
  late List<Client> clients = [];
  late List<Product> products = [];
  late List<Deposit> deposits = [];
  late List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _fetchClients();
    _fetchProducts();
    _fetchDeposits();
    _fetchCategories();
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

  void refreshClients() {
    _fetchClients();
  }

  void refreshProduct() {
    _fetchProducts();
  }

  void refreshDeposits() {
    _fetchDeposits();
  }

  void refreshCategories() {
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultController(
            tabsNum: 4,
            tabsLabels: const ["Products", "Clients", "Categories", "Deposits"],
            refreshes: [
              refreshProduct,
              refreshClients,
              refreshCategories,
              refreshDeposits
            ],
            tabs: [
              ProductsWidget(products: products),
              ClientsWidget(clients: clients),
              CategoriesWidget(categories: categories),
              DepositsWidget(deposits: deposits),
            ],
          );
  }
}


