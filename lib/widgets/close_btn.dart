import 'package:flutter/material.dart';

class CloseBtn extends StatefulWidget {
  final Function(BuildContext context) onClose;
  const CloseBtn({Key? key, required this.onClose}) : super(key: key);

  @override
  State<CloseBtn> createState() => _CloseBtnState();
}

class _CloseBtnState extends State<CloseBtn> {
  Color _closeIconColor = Colors.white60;

  void _onEnterCloseButton(PointerEvent pe) {
    setState(() {
      _closeIconColor = Colors.lightBlue;
    });
  }

  void _onLeaveCloseButton(PointerEvent pe) {
    setState(() {
      _closeIconColor = Colors.white60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnterCloseButton,
      onExit: _onLeaveCloseButton,
      child: IconButton(
        onPressed: () => widget.onClose(context),
        icon: const Icon(Icons.close),
        iconSize: 60,
        color: _closeIconColor,
      ),
    );
  }
}
