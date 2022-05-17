import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final int? rating;

  const RatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late int currentRating;

  @override
  void initState() {
    currentRating = widget.rating ?? 0;
    super.initState();
  }

  Iterable<Widget> getStars() {
    return Iterable.generate(5, (index) {
      return Icon(
        currentRating > index ? Icons.star : Icons.star_border_outlined,
        key: ObjectKey(index),
        color: currentRating > index ? Colors.yellowAccent : Colors.white,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [...getStars()],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
