import 'package:flutter/material.dart';
import 'package:scan_inv/pages/widgets/scanner.dart';
import 'package:scan_inv/pages/widgets/generate_code.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: const Color.fromARGB(193, 70, 90, 206),
        title: const Text(
          'InvApp',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyGenerator(),
            MyScanner(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: const Color.fromARGB(193, 70, 90, 206),
          child: const Center(
            child: Text(
              '© 2026 Inventory Scanner App (InvApp)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
