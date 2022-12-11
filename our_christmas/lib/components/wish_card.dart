import 'dart:math';

import 'package:flutter/material.dart';
import 'package:our_christmas/theme/colors.dart';
import 'package:our_christmas/theme/sizes.dart';

enum DragStatus { non, left, right }

class WishCard extends StatefulWidget {
  final bool top;
  final String quote;
  final Function(DragStatus?, String) onChanged;
  final bool hasHistory;
  final String summery;

  const WishCard({
    Key? key,
    required this.top,
    required this.quote,
    required this.onChanged,
    required this.hasHistory,
    required this.summery,
  }) : super(key: key);

  @override
  State<WishCard> createState() => _WishCardState();
}

class _WishCardState extends State<WishCard> {
  Offset _position = Offset.zero;
  bool _isDragging = false;
  Size _screenSize = Size.zero;
  double _angle = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _screenSize = MediaQuery.of(context).size;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildFrontWishCard(context);
  }

  void notifyListener() {
    setState(() {});
  }

  void onPanStart(DragStartDetails details) {
    _isDragging = true;
    notifyListener();
  }

  void onPanUpdate(DragUpdateDetails details) {
    _position += details.delta;
    _angle = 22 * (_position.dx / (_screenSize.width));
    notifyListener();
  }

  void resetPan() {
    _isDragging = false;
    _angle = 0;
    _position = Offset.zero;

    notifyListener();
  }

  void callback(DragStatus? status) async {
    await Future.delayed(const Duration(milliseconds: 150));
    widget.onChanged(status, widget.quote);
  }

  void onPanEnd(DragEndDetails details) {
    _isDragging = false;
    // notifyListener();

    DragStatus? status = getStatus();
    if (status == DragStatus.right && widget.hasHistory) {
      _dragRight(() => callback(status));
    } else if (status == DragStatus.left) {
      _dragLeft(() => callback(status));
    } else {
      resetPan();
    }
  }

  void _dragRight(Function() callback) {
    _angle = 22;
    _position += Offset(_screenSize.width * 2, 0);
    notifyListener();

    callback();
  }

  void _dragLeft(Function() callback) {
    _angle = -22;
    _position -= Offset(_screenSize.width * 2, 0);
    notifyListener();

    callback();
  }

  DragStatus? getStatus() {
    final double x = _position.dx;

    double delta = 100;
    if (x >= delta) {
      return DragStatus.right;
    } else if (x <= -delta) {
      return DragStatus.left;
    }

    return null;
  }

  Widget buildFrontWishCard(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      Duration duration = _isDragging ? const Duration(milliseconds: 0) : const Duration(milliseconds: 200);
      final double angle = _angle * pi / 100;
      final centerPosition = contraint.smallest.center(Offset.zero);
      final rotationMetrics = Matrix4.identity()
        ..translate(centerPosition.dx, centerPosition.dy)
        ..rotateZ(angle)
        ..translate(-centerPosition.dx, -centerPosition.dy);

      return AnimatedContainer(
        transform: rotationMetrics..translate(_position.dx, _position.dy),
        curve: Curves.easeOut,
        duration: duration,
        child: GestureDetector(
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanEnd: onPanEnd,
          child: buildWishCard(context),
        ),
      );
    });
  }

  Widget buildWishCard(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 200,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.cardPadding,
        vertical: AppSizes.cardPadding,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: AppSizes.defaultBorderRadius,
        color: AppColors.white,
        boxShadow: widget.top
            ? [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                ),
              ]
            : [],
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              widget.quote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Courgette",
                  ),
            ),
            const SizedBox(height: AppSizes.elementSpacing * 0.5),
            Text(
              widget.summery,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 0,
                    color: AppColors.dimGrey,
                    fontFamily: "Courgette",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
