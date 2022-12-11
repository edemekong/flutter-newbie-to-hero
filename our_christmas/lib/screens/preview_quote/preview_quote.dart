import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/theme/colors.dart';
import 'package:our_christmas/theme/sizes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

import '../../states/quotes_state.dart';

class PreviewQuote extends ConsumerStatefulWidget {
  final String quote;
  const PreviewQuote({super.key, required this.quote});

  @override
  ConsumerState<PreviewQuote> createState() => _PreviewQuoteState();
}

class _PreviewQuoteState extends ConsumerState<PreviewQuote> {
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  Future<File?> captureWidget() async {
    try {
      RenderRepaintBoundary repaintBoundary =
          _repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await repaintBoundary.toImage(pixelRatio: 2.0);
      Directory directory = await getTemporaryDirectory();
      File tempFile = File("${directory.path}${DateTime.now().millisecondsSinceEpoch}.png");
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        tempFile.writeAsBytes(byteData.buffer.asUint8List());
        return tempFile;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void shareCapturedWidget() async {
    final image = await captureWidget();
    if (image != null) {
      Share.shareXFiles(
        [XFile(image.path)],
      );
    }
  }

  void saveFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final File? image = await captureWidget();
    if (image == null) return;

    File file = File(path.join(directory.path, image.path));
    await file.writeAsString('Merry Christmas!');

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: AppSizes.defaultBorderRadius.copyWith(
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        content: Text(
          'Successfully save image.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        backgroundColor: AppColors.white,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
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
                      "Share to \nFriends & Family",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightGrey,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.cardPadding * 2),
                IgnorePointer(
                  child: Hero(
                    tag: widget.quote,
                    child: RepaintBoundary(
                      key: _repaintBoundaryKey,
                      child: ClipRRect(
                        borderRadius: AppSizes.defaultBorderRadius,
                        child: Container(
                          padding: const EdgeInsets.all(AppSizes.cardPadding),
                          constraints: const BoxConstraints(minHeight: 200),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: AppSizes.defaultBorderRadius,
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor.withOpacity(.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.normal,
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: AppSizes.elementSpacing),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) {
                                  return SizedBox(height: 40, child: Image.asset("assets/images/${index + 1}.png"));
                                }),
                              ),
                              const SizedBox(height: AppSizes.cardPadding),
                              Text(
                                "MERRY CHRISTMAS",
                                style: Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      // fontFamily: "Courgette",
                                    ),
                              ),
                              const SizedBox(height: AppSizes.elementSpacing),
                              Center(
                                child: Text(
                                  widget.quote,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline4?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Courgette",
                                      ),
                                ),
                              ),
                              const SizedBox(height: AppSizes.cardPadding),
                              Text(
                                ref.watch(messageProvider),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: "Courgette",
                                    ),
                              ),
                              const SizedBox(height: AppSizes.elementSpacing),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.cardPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: shareCapturedWidget,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppSizes.elementSpacing * 0.8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.share,
                                size: 25,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSizes.elementSpacing * 0.5),
                          Text(
                            'Share via...',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSizes.cardPadding),
                    InkWell(
                      onTap: saveFile,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppSizes.elementSpacing * 0.8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.arrow_down_circle,
                                size: 25,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSizes.elementSpacing * 0.5),
                          Text(
                            'Save image',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
