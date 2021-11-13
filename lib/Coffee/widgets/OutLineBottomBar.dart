import 'package:flutter/material.dart';

class OutLineBottomBar extends StatelessWidget {
  final Widget child;
  OutLineBottomBar({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
