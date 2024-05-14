import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salt_code_test/core/router/app_router.dart';
import 'package:salt_code_test/core/ui_constants/app_fonts.dart';
import 'package:salt_code_test/core/ui_constants/app_size.dart';
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Durations.extralong4).then((value) {
      context.router.replaceAll([const HomeRoute()]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News App",
              style: AppFonts.primaryBoldTextStyle
                  .copyWith(fontSize: AppSize.headline),
            ),
            const SizedBox(
              height: AppSize.smallPadding,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
