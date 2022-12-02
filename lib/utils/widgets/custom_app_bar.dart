import 'package:flutter/material.dart';
import '../app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.name,
    this.action,
  });

  final String name;
  final List<Widget>? action;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kBlack,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          name,
          style: const TextStyle(fontSize: 19),
        ),
        actions: action);
  }
}
