// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final bool isFavorite;
  final void Function()? onPressed;

  const QuoteCard(
      {super.key,
      required this.quote,
      required this.author,
      required this.isFavorite,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100], borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quote),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(author),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
