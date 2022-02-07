import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfPage extends StatefulWidget {
  const PdfPage(this.pdfUri);

  final String pdfUri;

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  late PdfController pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfController(
      document: PdfDocument.openAsset(widget.pdfUri),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Image(image: AssetImage(PathConstants.back)),
        ),
      ),
      body: Center(
          child: PdfView(
        controller: pdfController,
      )),
    );
  }
}
