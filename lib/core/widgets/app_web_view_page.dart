import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewPage extends StatelessWidget {
  final WebViewController controller;
  const AppWebViewPage({super.key , required this.controller});

  @override
  Widget build(BuildContext context) {
    // String? url;
    // final controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..loadRequest(Uri.parse('https://youtube.com'));
    return SafeArea(
      child: SizedBox(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
