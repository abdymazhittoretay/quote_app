// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quote_app/boxes.dart';
import 'package:quote_app/fav_quote.dart';
import 'package:quote_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavQuoteAdapter());
  boxFavs = await Hive.openBox<FavQuote>("favoriteBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
