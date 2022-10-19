import 'package:flutter/material.dart';
import 'package:widget_explained/inherited_widget.dart';
import 'package:widget_explained/stateless_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoriteState(
        child: const Scaffold(
          body: Center(
            child: FavoriteStatelessButton(),
          ),
        ),
      ),
    );
  }
}
