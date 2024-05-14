import 'package:flutter/material.dart';
import 'package:salt_code_test/injection.dart';
import 'core/router/app_router.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return MaterialApp.router(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
        
      ),
      
    );
  }
}
