import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectPage extends StatelessWidget {
  final String title;
  final Widget child;

  const SelectPage({Key key, @required this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              iconTheme: Theme.of(context).iconTheme,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.title.color),
                  ),
                ),
                centerTitle: true,
              ),
              expandedHeight: 200,
              backgroundColor: Colors.white,
              floating: true,
            ),
            this.child
          ],
        ));
  }
}