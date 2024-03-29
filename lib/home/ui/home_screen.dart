import 'package:dio_training/home/ui/user_grid/user_grid_builder.dart';
import 'package:dio_training/home/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final vm = context.read<HomeScreenViewModel>();
    Future.microtask(() => vm.fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Selector<HomeScreenViewModel, bool>(
          builder: (context, loading, child) {
            if (loading) return const CircularProgressIndicator();
            return const UserGridBuilder();
          },
          selector: (p0, p1) => p1.loading,
        ),
      ),
    );
  }
}
