
import 'package:flutter/cupertino.dart';

import '../ui_constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 15,
        color: AppTheme.white,
      ),
    );
  }
}