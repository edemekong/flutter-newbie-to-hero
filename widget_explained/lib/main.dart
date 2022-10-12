import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyStatefullWidget(),
    ),
  ));
}

// stateless widget.
class MyStateLessWidget extends StatelessWidget {
  const MyStateLessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.favorite);
  }
}

//statefull widget
class MyStatefullWidget extends StatefulWidget {
  const MyStatefullWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefullWidget> createState() => _MyStatefullWidgetState();
}

//persistant state class,
class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  bool isFavorite = false; // holds boolean states whenever user toggles the favorite icon.

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => isFavorite =
            !isFavorite); // calling setState rebuilds the build() method using the new value of the [isFavorite] variable.
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
