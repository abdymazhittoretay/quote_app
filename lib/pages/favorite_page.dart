// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quote_app/database/boxes.dart';
import 'package:quote_app/model/fav_quote.dart';
import 'package:quote_app/pages/widgets/quote_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
      body: boxFavs.isNotEmpty
          ? ListView.builder(
              itemCount: boxFavs.length,
              itemBuilder: (context, index) {
                final FavQuote favorite =
                    boxFavs.getAt(boxFavs.values.length - 1 - index);
                return QuoteCard(
                    quote: favorite.quote,
                    author: favorite.author,
                    isFavorite: true,
                    onPressed: () {
                      setState(() {
                        final deleteKey = boxFavs.keys.firstWhere((key) {
                          final FavQuote someQuote = boxFavs.get(key);
                          return someQuote.quote == favorite.quote &&
                              someQuote.author == favorite.author;
                        });
                        boxFavs.delete(deleteKey);
                      });
                    });
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
