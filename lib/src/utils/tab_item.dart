import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isMedium;
  final Function()? onTap;

  const TabItem({
    Key? key,
    required this.title,
    this.isMedium = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tab(
        icon: Text(
          title,
          style: TextStyle(
            fontSize: isMedium ? 20 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
