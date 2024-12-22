// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quote_app/model/quote.dart';
import 'package:quote_app/pages/widgets/quote_card.dart';

class FavouritesPage extends StatelessWidget {
  final List<Quote> favQuotes;

  const FavouritesPage({super.key, required this.favQuotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Favourites"),
        centerTitle: true,
      ),
      body: favQuotes.isNotEmpty
          ? ListView.builder(
              itemCount: favQuotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(
                    quote: favQuotes[index].quote,
                    author: favQuotes[index].author);
              })
          : Center(
              child: Text(
                "There is no favourite quotes yet.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
    );
  }
}
