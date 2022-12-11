import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/components/snow.dart';
import 'package:our_christmas/components/wish_card.dart';
import 'package:our_christmas/screens/overview/widgets/app_bar.dart';
import 'package:our_christmas/screens/overview/widgets/bottom_action.dart';
import 'package:our_christmas/screens/preview_quote/preview_quote.dart';
import 'package:our_christmas/screens/set_up/setup.dart';
import 'package:our_christmas/states/quotes_state.dart';
import 'package:our_christmas/theme/colors.dart';
import 'package:our_christmas/theme/sizes.dart';

class Overview extends ConsumerStatefulWidget {
  const Overview({super.key});

  @override
  ConsumerState<Overview> createState() => _OverviewState();
}

class _OverviewState extends ConsumerState<Overview> {
  String? currentQuote;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setUpSummery();
    });

    super.initState();
  }

  void setUpSummery() {
    showDialog(
      context: context,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: const SetUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quotes = ref.watch(quotesProvider).reversed.toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            left: -200,
            bottom: -50,
            child: Image.asset(
              'assets/images/tree.png',
              width: 500,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(.3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          if (currentQuote != null) const SnowWidget(isRunning: true, totalSnow: 50, speed: 1),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.cardPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const OurChristmasAppbar(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Merry Christmas!",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                                height: 1,
                                fontWeight: FontWeight.w800,
                                color: AppColors.white,
                              ),
                        ),
                        const SizedBox(height: AppSizes.elementSpacing * 0.5),
                        Text(
                          "Send that special someone a\nchristmas card!",
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                height: 1.1,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGrey,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.cardPadding * 2),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: List.generate(
                          quotes.length,
                          (index) {
                            final String quote = quotes[index];
                            final isTop = quote == quotes.last;
                            if (isTop) {
                              currentQuote = quote;
                            }

                            return Hero(
                              tag: quote,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                      child: PreviewQuote(quote: quote),
                                    ),
                                  );
                                },
                                child: Transform.rotate(
                                  angle: index % 2 == 0 ? -0.09 : 0.09,
                                  child: WishCard(
                                    hasHistory: ref.watch(quotesProvider.notifier).history.isNotEmpty,
                                    onChanged: (status, String quote) {
                                      if (status == DragStatus.left) {
                                        ref.read(quotesProvider.notifier).removeQuote(quote);
                                      }
                                      if (status == DragStatus.right) {
                                        ref.read(quotesProvider.notifier).goBack();
                                      }
                                    },
                                    top: index == quotes.length - 1 || index == quotes.length - 2,
                                    quote: quote,
                                    summery: ref.watch(messageProvider),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.cardPadding * 2),
                    if (currentQuote != null) BottomAction(currentQuote: currentQuote!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
