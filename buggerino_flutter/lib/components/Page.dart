import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final Widget title;
  final Widget body;

  Page({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this.title,
      ),
      body: this.body,
    );
  }
}