import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final bool filled;
  final bool highlighted;

  const RatingStar({
    Key? key,
    required this.filled,
    required this.highlighted,
  }) : super(key: key);

  IconData getStar() {
    if (filled) return Icons.star;
    return Icons.star_border_outlined;
  }

  Color getColor() {
    if (filled || highlighted) return Colors.yellowAccent;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      getStar(),
      color: getColor(),
    );
  }
}
