import 'dart:math';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color color;
  final double size;

  const Logo({
    required this.color,
    required this.size,
  }) 
  : assert(color != null),
    assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle: -pi / 4,
      angle: -pi / 90,
      child: Icon(
        Icons.wb_incandescent_outlined,
        color: color,
        size: size,
      ),
    );
  }
}