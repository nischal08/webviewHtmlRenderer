import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTest extends StatefulWidget {
  @override

  
  State<StatefulWidget> createState() {
    return _WebViewTestState();
  }
}

class _WebViewTestState extends State<WebViewTest> {
  late WebViewController _webViewController;
  //
  String filePath = 'html/webview.html';
@override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((_) => _webViewController.runJavascriptReturningResult(
            'sendData("Niraj Karanjeet","Esewa","Worldlink Payment","Rs.4000")')) ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview Eg'),
      ),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async{
          _webViewController = webViewController;
         await _loadHtmlFromAssets();
          // _webViewController.runJavascriptReturningResult(
          //   'sendData("Niraj Karanjeet","Esewa","Worldlink Payment","Rs.4000")');
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
