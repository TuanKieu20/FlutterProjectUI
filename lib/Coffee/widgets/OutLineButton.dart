import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
  final Widget child;
  final color;
  OutLineButton({required this.child, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
  }
}
