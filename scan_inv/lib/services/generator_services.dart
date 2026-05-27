import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GeneratorServices {
  static BarcodeWidget generateCode(
      {required String code, required bool isQR}) {
    if (isQR) {
      return BarcodeWidget(
          data: code,
          barcode: Barcode.qrCode(),
          padding: const EdgeInsets.all(8.0));
    } else {
      return BarcodeWidget(
          data: code,
          barcode: Barcode.code128(),
          padding: const EdgeInsets.all(8.0));
    }
  }
}
