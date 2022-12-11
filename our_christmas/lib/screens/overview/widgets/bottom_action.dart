import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/states/quotes_state.dart';
import 'package:our_christmas/screens/preview_quote/preview_quote.dart';
import 'package:our_christmas/theme/colors.dart';
import 'package:our_christmas/theme/sizes.dart';

class BottomAction extends ConsumerWidget {
  final String currentQuote;

  const BottomAction({super.key, required this.currentQuote});

  @override
  Widget build(BuildContext context, ref) {
    final favorites = ref.watch(favoriteQuotesProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            if (ref.watch(quotesProvider).isEmpty) ...[
              InkWell(
                onTap: () {
                  ref.read(quotesProvider.notifier).restart();
                },
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.elementSpacing),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.restart_alt,
                      size: 30,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.cardPadding),
            ],
            InkWell(
              onTap: () {
                ref.read(favoriteQuotesProvider.notifier).toggle(currentQuote);
              },
              child: Container(
                padding: const EdgeInsets.all(AppSizes.elementSpacing),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    favorites.contains(currentQuote) ? Icons.favorite : Icons.favorite_outline,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSizes.cardPadding),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: PreviewQuote(
                      quote: currentQuote,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(AppSizes.elementSpacing),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: -0.65,
                    child: const Icon(
                      Icons.send,
                      size: 30,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: ref.watch(quotesProvider.notifier).history.isNotEmpty,
              replacement: const SizedBox(width: 16),
              child: IconButton(
                onPressed: () {
                  ref.read(quotesProvider.notifier).goBack();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 16,
                ),
              ),
            ),
            Visibility(
              visible: ref.watch(quotesProvider).isNotEmpty,
              replacement: const SizedBox(width: 16),
              child: IconButton(
                onPressed: () {
                  ref.read(quotesProvider.notifier).removeQuote(currentQuote);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
