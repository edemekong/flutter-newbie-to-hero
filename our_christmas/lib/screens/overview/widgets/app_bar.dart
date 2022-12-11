import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/states/quotes_state.dart';
import 'package:our_christmas/theme/colors.dart';

class OurChristmasAppbar extends ConsumerWidget {
  const OurChristmasAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final favorites = ref.watch(favoriteQuotesProvider);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        if (favorites.isNotEmpty)
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 40,
              color: AppColors.white,
            ),
          ),
      ],
    );
  }
}
