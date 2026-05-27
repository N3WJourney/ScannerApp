import 'package:flutter/material.dart';

class MyScanner extends StatelessWidget {
  const MyScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: double.infinity,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Scan'),
        ),
      ),
    );
  }
}
