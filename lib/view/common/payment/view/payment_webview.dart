import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/controller/payment/payment_controller.dart';
import 'package:real_estate_management/view/common/payment/view/payment_failed.dart';
import 'package:real_estate_management/view/common/payment/view/payment_success.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {

  final String paymentUrl;

  const PaymentWebView({super.key, required this.paymentUrl});
  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  final PaymentRequestController paymentRequestController = Get.put(PaymentRequestController());

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: WebView(
        initialUrl: widget.paymentUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        onPageStarted: (String url) {
          setState(() {
            Future.delayed(Duration(milliseconds: 300), () {

            });
          });
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
          setState(() {

            Future.delayed(Duration(milliseconds: 300), () {
              paymentRequestController.paymentDone(paymentUrl: url);
            });
          });
        },
      ),
    );
  }
}
