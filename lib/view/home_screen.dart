import 'package:flutter/material.dart';
import 'package:nikeyboots/view/drawer_screen.dart';
import 'package:nikeyboots/view/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [DrawerScreen(), HomeView()],
      ),
    );
  }
}
