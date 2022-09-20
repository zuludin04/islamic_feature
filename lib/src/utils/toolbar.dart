import 'package:flutter/material.dart';

class Toolbar {
  static AppBar defaultToolbar(
    BuildContext context,
    String title, {
    List<Widget> actions = const [],
  }) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.chevron_left_rounded,
          color: Color(0xff111410),
        ),
      ),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff111410),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }
}
