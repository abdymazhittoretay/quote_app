// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quote_app/model/quote.dart';

class FavoritePage extends StatelessWidget {
  final List<Quote> favQuotes;

  const FavoritePage({super.key, required this.favQuotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: favQuotes.isNotEmpty
          ? ListView.builder(
              itemCount: favQuotes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favQuotes[index].quote),
                  subtitle: Text(favQuotes[index].author),
                );
              })
          : Center(
              child: Text(
                "No favorite quotes yet.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
    );
  }
}
