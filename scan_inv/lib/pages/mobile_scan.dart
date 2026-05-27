import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MyMobileScan extends StatefulWidget {
  final ValueChanged<bool>? onCloseScanner;
  const MyMobileScan({Key? key, this.onCloseScanner}) : super(key: key);

  @override
  State<MyMobileScan> createState() => _MyMobileScanState();
}

class _MyMobileScanState extends State<MyMobileScan> {
  String barCode = 'Please scan the code...';

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
                child: /*MobileScanner(
                  onDetect: (capture) {
                    final Barcode barcodes = capture.barcodes.first;
                    setState(() {
                      barCode = barcodes.rawValue ?? '---';
                    });
                  },
                ),*/
                    const Center(
                  child: Text(
                    'Scanner Placeholder',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.indigoAccent,
                  alignment: Alignment.center,
                  child: Text(
                    barCode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
