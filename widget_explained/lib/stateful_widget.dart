import 'package:flutter/material.dart';

class FavoriteStatefulButton extends StatefulWidget {
  const FavoriteStatefulButton({Key? key}) : super(key: key);

  @override
  State<FavoriteStatefulButton> createState() => _FavoriteStatefulButtonState();
}

class _FavoriteStatefulButtonState extends State<FavoriteStatefulButton> {
  /// holds boolean states whenever user toggles the favorite icon.
  bool _isFavorite = false;

  void _changeButtonState() {
    setState(() {
      /// calling setState rebuilds the build() method using the new value of the [isFavorite] variable.
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _changeButtonState,
      icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
