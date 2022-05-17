import 'package:flutter/material.dart';
import 'rating_star.dart';

class RatingBar extends StatefulWidget {
  final int? rating;

  const RatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late int _currentRating;
  int _hoverIndex = -1;

  @override
  void initState() {
    _currentRating = widget.rating ?? 0;
    super.initState();
  }

  void _onEnterStar(int index) {
    setState(() {
      _hoverIndex = index;
    });
  }

  void _onLeaveStar(int index) {
    setState(() {
      _hoverIndex = -1;
    });
  }

  Iterable<Widget> getStars() {
    return Iterable.generate(
      5,
      (index) {
        return MouseRegion(
          key: ObjectKey(index),
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _onEnterStar(index),
          onExit: (_) => _onLeaveStar(index),
          child: RatingStar(
            filled: _currentRating > index,
            highlighted: _hoverIndex >= index,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [...getStars()],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
