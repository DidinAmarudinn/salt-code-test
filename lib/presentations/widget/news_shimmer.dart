import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/ui_constants/app_size.dart';

class NewsShimmerItem extends StatelessWidget {

  const NewsShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Shimmer.fromColors( // Shimmer effect for title
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: AppSize.extraSmallPadding,
                ),
                Shimmer.fromColors( // Shimmer effect for content
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: AppSize.smallPadding,
          ),
          SizedBox( // Placeholder for image
            height: 120,
            width: 120,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}