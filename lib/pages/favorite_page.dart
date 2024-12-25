// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quote_app/boxes.dart';
import 'package:quote_app/fav_quote.dart';

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
                final FavQuote quote = boxFavs.getAt(index);
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              boxFavs
                                  .delete("key_${quote.quote}_${quote.author}");
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(quote.quote),
                            SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(quote.author),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
