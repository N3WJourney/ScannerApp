import 'package:flutter/material.dart';
import 'package:scan_inv/services/generator_services.dart';

class MyGenerator extends StatefulWidget {
  const MyGenerator({Key? key}) : super(key: key);

  @override
  State<MyGenerator> createState() => _MyGeneratorState();
}

class _MyGeneratorState extends State<MyGenerator> {
  late String codeText;
  late bool typeCode;
  String cardCode = "";
  bool isQRcode = true;

  void _generateCode() {
    setState(() {
      cardCode = codeText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 280,
          child: Card(
            child: Center(
              child: GeneratorServices.generateCode(
                code: cardCode,
                isQR: isQRcode,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Serial Code',
                  prefixIcon: Icon(Icons.qr_code),
                ),
                onChanged: (text) {
                  codeText = text;
                },
                onSubmitted: (_) => _generateCode(),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: isQRcode,
                  activeThumbColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      isQRcode = value;
                    });
                  },
                ),
                const Text('QR'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _generateCode,
          child: const Text('Generate Code'),
        ),
      ],
    );
  }
}
