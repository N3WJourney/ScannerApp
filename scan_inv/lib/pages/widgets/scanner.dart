import 'package:flutter/material.dart';

class MyScanner extends StatelessWidget {
  const MyScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Scan'),
          ),
        ),
      ],
    );
  }
}
