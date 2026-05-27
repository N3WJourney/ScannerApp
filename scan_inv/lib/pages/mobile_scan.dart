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
        Container(
          width: 500,
          height: 500,
          color: Colors.black54,
          child: const Center(
            child: Text(
              'Scanner Placeholder',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
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
