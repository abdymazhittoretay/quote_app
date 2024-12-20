// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_app/model/quote.dart';

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
    for(var i in data){
      final Quote quote = Quote(quote: i["q"], author: i["a"]);
      quotes.add(quote);
    }

    print(quotes);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.format_quote),
            SizedBox(width: 5.0,),
            Text("Quotes"),
          ],
        ),
      ),
      body: FutureBuilder(future: getQuotes(), builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text("${quotes[index].quote} ${quotes[index].author}"),
              );
          });
        }
        else{
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