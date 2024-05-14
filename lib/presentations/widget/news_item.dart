import 'package:flutter/material.dart';
import 'package:salt_code_test/core/extenstions/string_ext.dart';
import 'package:salt_code_test/core/ui_constants/app_size.dart';
import 'package:salt_code_test/domain/entities/article.dart';

import '../../core/ui_constants/app_colors.dart';
import '../../core/ui_constants/app_fonts.dart';
import '../../core/widget/news_image_widget.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.article, super.key, required this.index});
  final int index;
  final Article article;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (index == 0) {
      return Container(
        height: 250,
        padding: const EdgeInsets.only(bottom: AppSize.smallPadding),
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(AppSize.radius)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.radius),
                child: NewsImageWidget(
                  imageUrl: article.urlToImage ?? "",
                ),
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(
                      AppSize.radius,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent, // Start with transparent color
                      Colors.black.withOpacity(
                          0.7), // Your desired overlay color with opacity
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: AppSize.smallPadding,
              left: AppSize.smallPadding,
              right: AppSize.smallPadding,
              child: Text(
                article.title ?? "-",
                style: AppFonts.whiteSemiBoldTextStyle,
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSize.padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "-",
                    style: AppFonts.primarySemiBoldTextStyle,
                  ),
                  const SizedBox(
                    height: AppSize.extraSmallPadding,
                  ),
                  Text(
                    article.content ?? "-",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.primaryLightTextStyle.copyWith(
                      fontSize: AppSize.caption,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.extraSmallPadding,
                  ),
                  Text(
                    (article.publishedAt ?? "-").toFormatedDate(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.primaryRegularTextStyle.copyWith(
                      fontSize: AppSize.overline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.smallPadding,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: article.urlToImage == null
                  ? Container(
                      color: AppTheme.grayColor,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.radius),
                      child: NewsImageWidget(
                        imageUrl: article.urlToImage!,
                        height: 120,
                        width: 120,
                      ),
                    ),
            ),
          ],
        ),
      );
    }
  }
}
