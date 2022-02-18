import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:fitness_flutter/core/const/path_constants.dart';

class WebPage extends StatefulWidget {
  const WebPage(this.webUrl, {Key? key}) : super(key: key);

  final String webUrl;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
          child: WebView(
        initialUrl: widget.webUrl,
      )),
    );
  }
}
