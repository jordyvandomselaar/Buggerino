import 'package:flutter/material.dart';

class Project {
  final String name;
  final String errorsUrl;
  final int openErrorCount;

  Project({@required this.name, @required this.errorsUrl, @required this.openErrorCount});
}