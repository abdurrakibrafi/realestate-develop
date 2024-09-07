import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:signature/signature.dart';

class SignatureCapture extends StatefulWidget {
  @override
  _SignatureCaptureState createState() => _SignatureCaptureState();
}

class _SignatureCaptureState extends State<SignatureCapture> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  Future<void> _saveSignature() async {
    if (_controller.isNotEmpty) {
      final signature = await _controller.toPngBytes();
      if (signature != null) {
        try {
          // Get the application documents directory
          final directory = await getApplicationDocumentsDirectory();

          // Create a file path for the signature
          final filePath = path.join(directory.path, 'signature.png');

          // Save the signature to the file
          final file = File(filePath);
          await file.writeAsBytes(signature);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signature saved to $filePath')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving signature: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signature Capture'),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.grey[200]!,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: Text('Clear'),
              ),
              ElevatedButton(
                onPressed: _saveSignature,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
