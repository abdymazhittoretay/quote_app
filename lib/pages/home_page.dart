// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_app/database/boxes.dart';
import 'package:quote_app/model/fav_quote.dart';
import 'package:quote_app/model/quote.dart';
import 'package:quote_app/pages/favorite_page.dart';
import 'package:quote_app/pages/widgets/quote_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quote> quotes = [];

  Future getQuotes() async {
    final response = await http.get(Uri.https("zenquotes.io", "/api/quotes"));
    final data = jsonDecode(response.body);
    for (var i in data) {
      final Quote quote = Quote(quote: i["q"], author: i["a"]);
      quotes.add(quote);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.format_quote),
            SizedBox(
              width: 5.0,
            ),
            Text("Quotes"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  )).then((_) {
                setState(() {});
              });
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: quotes.isNotEmpty
          ? ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final Quote quote = quotes[index];
                final bool isFavorite = boxFavs.values.any((fav) =>
                    fav.quote == quote.quote && fav.author == quote.author);
                return QuoteCard(
                  quote: quote.quote,
                  author: quote.author,
                  isFavorite: isFavorite,
                  onPressed: () {
                    setState(() {
                      if (isFavorite) {
                        final deleteKey = boxFavs.keys.firstWhere((key) {
                          final FavQuote fav = boxFavs.get(key);
                          return fav.quote == quote.quote &&
                              fav.author == quote.author;
                        });
                        boxFavs.delete(deleteKey);
                      } else {
                        boxFavs.add(
                            FavQuote(quote: quote.quote, author: quote.author));
                      }
                    });
                  },
                );
              })
          : Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
    );
  }
}
