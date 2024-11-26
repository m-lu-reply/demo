import 'package:demo/cart.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScannerSection extends StatefulWidget {
  const ScannerSection({Key? key}) : super(key: key);

  @override
  State<ScannerSection> createState() => _ScannerSectionState();
}

class _ScannerSectionState extends State<ScannerSection> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String && res != '-1') {
                    result = res;

                    Cart().addItem(res);
                  }
                });
              },
              child: const Text('Open Scanner'),
            ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}
