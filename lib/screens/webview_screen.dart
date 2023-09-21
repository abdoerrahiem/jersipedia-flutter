import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/order/order_bloc.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String title;
  final String uri;
  final bool fromHistory;

  const WebviewScreen({
    super.key,
    required this.title,
    required this.uri,
    this.fromHistory = false,
  });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            loading = false;
          },
          onUrlChange: (change) {
            loading = false;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }

            if (request.url.contains('order_id=')) {
              if (widget.fromHistory) {
                Navigator.pop(context);
                context.read<OrderBloc>().add(GetOrders());
              } else {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/history-checkout');
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.uri));

    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightBlack,
          ),
        ),
        centerTitle: true,
        backgroundColor: blueColor,
        leadingWidth: 90,
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                icon: const Icon(Icons.chevron_left),
                color: blueColor,
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loading)
            Center(child: CircularProgressIndicator(color: whiteColor))
        ],
      ),
    );
  }
}
