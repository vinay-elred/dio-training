import 'package:dio_training/home/ui/home_screen.dart';
import 'package:dio_training/home/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
