import 'package:flutter/material.dart';

class FloatingActionButtonKit extends StatelessWidget {
  const FloatingActionButtonKit(
      {required this.floatingIcon, required this.onClick, super.key});

  final VoidCallback onClick;
  final Icon floatingIcon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      child: floatingIcon,
    );
  }
}
