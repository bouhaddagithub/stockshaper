import 'package:flutter/material.dart';
import 'package:stckshaper/sqlite/database_connection.dart';

class TempHomePage extends StatefulWidget {
  const TempHomePage({super.key});

  @override
  State<TempHomePage> createState() => _TempHomePageState();
}

class _TempHomePageState extends State<TempHomePage> {
  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.database; // it will initialize the database.
    print('database intialized .');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('goooooooooooooooooooood'),
      ),
      body:const  Center(
        child: Text('VERY GOOOOOOOOOOOOOOOOOOOOOOD'),
      ),
    );
  }
}
