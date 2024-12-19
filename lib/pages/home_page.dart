// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getQuotes() async {
    final response = await http.get(Uri.https("zenquotes.io", "/api/quotes"));
    final data = jsonDecode(response.body);
    print(data);
  }


  @override
  Widget build(BuildContext context) {
    getQuotes();
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}