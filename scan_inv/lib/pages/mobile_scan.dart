/*import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MyMobileScan extends StatefulWidget {
  const MyMobileScan({Key? key}) : super(key: key);

  @override
  State<MyMobileScan> createState() => _MyMobileScanState();
}

class _MyMobileScanState extends State<MyMobileScan> {
  String barCode = 'Please scan the code...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (result) {
                  if (result.barcodes.isNotEmpty &&
                      result.barcodes.first.rawValue != null) {
                    setState(() {
                      barCode = result.barcodes.first.rawValue!;
                    });
                  }
                },
                onDetectError: (error, _) {
                  setState(() {
                    barCode = 'Error scanning: $error';
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Scan Result: $barCode',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
