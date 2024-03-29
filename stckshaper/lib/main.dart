import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stckshaper/models/provider_classes.dart';
import 'package:stckshaper/pages/navigation.dart';
import 'package:stckshaper/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GL Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
        // fontFamily: "Roboto",
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<NavIndex>(
        create: (context) => NavIndex(),
        child: const Navigation(),
      ),
    );
  }
}
