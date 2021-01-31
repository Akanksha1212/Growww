import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BotScreen extends StatefulWidget {
  @override
  _BotScreenState createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60316E),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 35, 20, 10),
        color: Color(0xffACF28B),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            child: WebView(
          initialUrl: Uri.dataFromString(
                  '<html><body><iframe src="<iframe width="350" height="430" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/0acba1e8-631e-4368-bf33-005c6b5db63a"></iframe>"></iframe></body></html>',
                  mimeType: 'text/html')
              .toString(),
        )),
      ),
    );
  }
}
