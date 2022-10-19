import 'package:flutter/material.dart';

class FavoriteStatelessButton extends StatelessWidget {
  const FavoriteStatelessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite),
    );
  }
}
