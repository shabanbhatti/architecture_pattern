import 'package:api_integration/config/injector/injectors.dart';
import 'package:api_integration/views/initial%20feature/common%20screen/common_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CommonScreen());
  }
}
