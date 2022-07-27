import 'package:flutter/material.dart';

class CloseBtn extends StatefulWidget {
  final Function(BuildContext context) onClose;
  const CloseBtn({Key? key, required this.onClose}) : super(key: key);

  @override
  State<CloseBtn> createState() => _CloseBtnState();
}

class _CloseBtnState extends State<CloseBtn> {
  Color _closeIconColor = Colors.white60;

  void _onEnterCloseButton() {
    setState(() {
      _closeIconColor = Colors.lightBlue;
    });
  }

  void _onLeaveCloseButton() {
    setState(() {
      _closeIconColor = Colors.white60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEnterCloseButton(),
      onExit: (_) => _onLeaveCloseButton(),
      child: IconButton(
        onPressed: () => widget.onClose(context),
        icon: const Icon(Icons.close),
        iconSize: 60,
        color: _closeIconColor,
      ),
    );
  }
}
