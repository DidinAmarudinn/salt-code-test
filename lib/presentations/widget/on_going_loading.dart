
import 'package:flutter/material.dart';
import 'package:salt_code_test/presentations/widget/news_shimmer.dart';

class OnGoingLoading extends StatelessWidget {
  const OnGoingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NewsShimmerItem(),
        NewsShimmerItem(),
      ],
    );
  }
}
