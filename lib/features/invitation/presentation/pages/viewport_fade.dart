import 'package:flutter/material.dart';

class ViewportFade extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;

  /// Fade başlamadan önceki görünürlük alanı
  final double fadeDistance;

  /// Yukarı doğru ne kadar hareket etsin
  final double translateDistance;

  const ViewportFade({
    super.key,
    required this.child,
    required this.scrollController,
    this.fadeDistance = 150,
    this.translateDistance = 30,
  });

  @override
  State<ViewportFade> createState() => _ViewportFadeState();
}

class _ViewportFadeState extends State<ViewportFade> {
  final _key = GlobalKey();

  double _opacity = 1;
  double translateY = 0;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onScroll();
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
  final context = _key.currentContext;

  if (context == null) return;

  final renderBox = context.findRenderObject() as RenderBox;

  final widgetTop =
      renderBox.localToGlobal(Offset.zero).dy;

  final screenHeight =
      MediaQuery.of(context).size.height;

  final fadeZoneHeight = screenHeight * .2;

  double opacity;

  if (widgetTop >= fadeZoneHeight) {
    opacity = 1;
  } else if (widgetTop <= 0) {
    opacity = 0;
  } else {
    opacity = widgetTop / fadeZoneHeight;
  }

  if (_opacity != opacity) {
    setState(() {
      _opacity = opacity;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, translateY),
      child: Opacity(
        opacity: _opacity,
        child: KeyedSubtree(
          key: _key,
          child: widget.child,
        ),
      ),
    );
  }
}