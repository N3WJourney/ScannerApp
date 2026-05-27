import 'package:flutter/material.dart';

class MyScanner extends StatefulWidget {
  final ValueChanged<bool>? onOpenScanner;
  const MyScanner({Key? key, this.onOpenScanner}) : super(key: key);

  @override
  State<MyScanner> createState() => _MyScannerState();
}

class _MyScannerState extends State<MyScanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ElevatedButton(
        onPressed: () {
          widget.onOpenScanner?.call(true);
        },
        child: const Text('Scan Code'),
      ),
    );
  }
}
