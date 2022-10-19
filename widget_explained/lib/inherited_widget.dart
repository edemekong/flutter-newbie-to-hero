import 'package:flutter/material.dart';

@immutable
class FavoriteState extends InheritedWidget {
  final Widget child;

  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  void setFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  FavoriteState({
    Key? key,
    required this.child,
  }) : super(key: key, child: child);

  static FavoriteState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteState>()!;
  }

  @override
  bool updateShouldNotify(FavoriteState oldWidget) {
    return oldWidget.isFavorite.value != isFavorite.value;
  }
}
