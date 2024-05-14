import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget {
  final Article article;
  const DetailNewsScreen({super.key, required this.article});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  late final WebViewController controller;
  bool loading = true;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.article.url ?? "-"),
      )
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (_) {
        loading = false;
        setState(() {});
      }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
    );
  }
}
