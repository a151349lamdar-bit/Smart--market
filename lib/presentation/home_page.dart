import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه اصلی بازار'),
      ),
      body: const Center(
        child: Text('به بازار هوشمند خوش آمدید'),
      ),
    );
  }
}
