import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/states/quotes_state.dart';
import 'package:our_christmas/theme/colors.dart';
import 'package:our_christmas/theme/sizes.dart';

class SetUpPage extends ConsumerWidget {
  const SetUpPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isNotEmpty = ref.watch(messageProvider).trim().isNotEmpty;
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: AppSizes.defaultBorderRadius,
      borderSide: BorderSide(
        color: AppColors.white,
      ),
    );
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.cardPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight),
              Row(
                children: [
                  Text(
                    "Enter message \nsummery",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGrey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.cardPadding),
              TextField(
                onChanged: (v) {
                  ref.read(messageProvider.notifier).state = v;
                },
                style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.white),
                decoration: InputDecoration(
                  border: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedErrorBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  hintText: 'Enter summery',
                ),
              ),
              const SizedBox(height: AppSizes.cardPadding * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    borderRadius: AppSizes.defaultBorderRadius,
                    onTap: isNotEmpty
                        ? () {
                            Navigator.pop(context);
                          }
                        : null,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: AppSizes.defaultBorderRadius,
                        color: isNotEmpty ? AppColors.white : AppColors.grey,
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                                color: AppColors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
