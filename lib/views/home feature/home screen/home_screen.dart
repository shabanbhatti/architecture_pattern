import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox(), title: Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
         
          },
          child: Text("hit APi"),
        ),
      ),
    );
  }
}
