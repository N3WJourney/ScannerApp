import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';

class MyMobileScan extends StatefulWidget {
  final ValueChanged<bool>? onCloseScanner;
  const MyMobileScan({Key? key, this.onCloseScanner}) : super(key: key);

  @override
  State<MyMobileScan> createState() => _MyMobileScanState();
}

class _MyMobileScanState extends State<MyMobileScan> {
  String barCode = 'Please scan the code...';
  void CopyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code copied to clipboard')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(
          color: Colors.black54,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: MobileScanner(
                  onDetect: (capture) {
                    final Barcode barcodes = capture.barcodes.first;
                    setState(() {
                      barCode = barcodes.rawValue ?? '---';
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.indigoAccent,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        barCode,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, color: Colors.white),
                        onPressed: () => CopyToClipboard(barCode),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 12,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              widget.onCloseScanner?.call(false);
            },
          ),
        ),
      ],
    );
  }
}
