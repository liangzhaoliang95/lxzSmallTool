import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/dns/ui/dns_page.dart';
import 'features/about/ui/about_page.dart';
import 'shared/layout/app_shell.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/dns',
      routes: [
        ShellRoute(
          builder: (context, state, child) => AppShell(child: child),
          routes: [
            GoRoute(
              path: '/dns',
              builder: (context, state) => const DnsPage(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => const Scaffold(
                body: Center(child: Text('设置页面（待实现）')),
              ),
            ),
            GoRoute(
              path: '/about',
              builder: (context, state) => const AboutPage(),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: '伯索云学堂调试助手',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
