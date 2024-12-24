// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List<Quote> favQuotes = [];

  Future getQuotes() async {
    final response = await http.get(Uri.https("zenquotes.io", "/api/quotes"));
    final data = jsonDecode(response.body);
    for (var i in data) {
      final Quote quote = Quote(quote: i["q"], author: i["a"]);
      quotes.add(quote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Quotes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(
                      favQuotes: favQuotes,
                    ),
                  )).then((_) {
                setState(() {});
              });
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final Quote quote = quotes[index];
                    final bool isFavorite = favQuotes.contains(quote);
                    return QuoteCard(
                      quote: quote.quote,
                      author: quote.author,
                      isFavorite: isFavorite,
                      onPressed: () {
                        setState(() {
                          if (favQuotes.contains(quote)) {
                            favQuotes.remove(quote);
                          } else {
                            favQuotes.insert(0, quote);
                          }
                        });
                      },
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          }),
    );
  }
}
