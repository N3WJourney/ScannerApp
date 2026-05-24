import 'package:flutter/material.dart';

class MyGenerator extends StatelessWidget {
  const MyGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Card(
          child: DisplayCode(cardName: "QR Code"),
        ),
        GenerateCode(),
      ],
    );
  }
}

class DisplayCode extends StatelessWidget {
  const DisplayCode({Key? key, required this.cardName}) : super(key: key);
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Center(child: Text(cardName)),
    );
  }
}

class GenerateCode extends StatelessWidget {
  const GenerateCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Serial Code',
        suffixIcon: Icon(Icons.qr_code),
      ),
    );
  }
}
