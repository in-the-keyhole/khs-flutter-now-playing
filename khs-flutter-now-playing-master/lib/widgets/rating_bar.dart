import 'package:flutter/material.dart';
import 'rating_star.dart';

class RatingBar extends StatefulWidget {
  final int? rating;
  final int movieId;
  final Function(int movieId, int newRating) onRatingClick;

  const RatingBar({
    Key? key,
    required this.rating,
    required this.movieId,
    required this.onRatingClick,
  }) : super(key: key);

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _hoverIndex = -1;

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

  void _onStarClick(int index) {
    widget.onRatingClick(widget.movieId, index + 1);
  }

  Iterable<Widget> getStars() {
    return Iterable.generate(
      5,
      (index) {
        return InkWell(
          key: ObjectKey(index),
          onTap: () => _onStarClick(index),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => _onEnterStar(index),
            onExit: (_) => _onLeaveStar(index),
            child: RatingStar(
              filled: (widget.rating ?? 0) > index,
              highlighted: _hoverIndex >= index,
            ),
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
