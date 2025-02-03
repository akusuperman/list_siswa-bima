import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppbar({super.key}) 
    : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: const Text("PPLG Apps", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
          );
  }
}