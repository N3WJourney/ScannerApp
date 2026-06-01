import 'package:flutter/material.dart';
import 'package:scan_inv/pages/inventory_list.dart';
import 'package:scan_inv/pages/mobile_scan.dart';
import 'package:scan_inv/pages/widgets/scanner.dart';
import 'package:scan_inv/pages/widgets/generate_code.dart';

class MyHomePage extends StatefulWidget {
  static bool showScanner = false;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void setShowScanner(bool v) => setState(() => showScanner = v);

  bool showScanner = false;

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
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text('Inventory List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyInventoryListPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                MyGenerator(),
                MyScanner(onOpenScanner: setShowScanner),
              ],
            ),
            if (showScanner) MyMobileScan(onCloseScanner: setShowScanner),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(193, 70, 90, 206),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(193, 70, 90, 206),
        child: SizedBox(
          height: 50.0,
          child: const Center(
            child: Text(
              '© 2026 Inventory Scanner App (InvApp)',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
