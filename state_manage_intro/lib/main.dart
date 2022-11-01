import 'package:flutter/material.dart';
import 'package:state_manage_intro/get_it.dart';

import 'home.dart';

void main() {
  GetItService.initializeGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
