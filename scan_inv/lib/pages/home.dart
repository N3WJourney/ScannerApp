import 'package:flutter/material.dart';
import 'package:scan_inv/pages/widgets/scanner.dart';
import 'package:scan_inv/pages/widgets/generatecode.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InvApp"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            MyGenerator(),
            MyScanner(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.indigo,
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
