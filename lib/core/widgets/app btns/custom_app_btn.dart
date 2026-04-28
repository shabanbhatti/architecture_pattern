import 'package:api_integration/core/typedef/typedef.dart';
import 'package:flutter/material.dart';

class CustomAppBtn extends StatelessWidget {
  const CustomAppBtn({super.key, required this.onTap, required this.title});
  final OnPressed onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(title));
  }
}
