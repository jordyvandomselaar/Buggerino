import 'package:buggerino_flutter/components/FlexibleSpaceBar.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectPage extends StatelessWidget {
  final String title;
  final Widget child;

  const SelectPage({Key key, @required this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final padding = mediaQuery.padding;
    final expandedHeight = (mediaQuery.size.height - padding.top - padding.bottom) / 3;


    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: Theme.of(context).iconTheme,
              flexibleSpace: prefix0.FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  title,
                  style: TextStyle(color: Theme.of(context).textTheme.title.color),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ),
              expandedHeight: expandedHeight,
              backgroundColor: Colors.white,
            ),
            this.child
          ],
        ));
  }
}
