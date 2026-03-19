import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              width: 72,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                border: Border(
                  right: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
              ),
              textStyle: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 12,
              ),
              selectedTextStyle: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              itemTextPadding: const EdgeInsets.only(left: 12),
              selectedItemTextPadding: const EdgeInsets.only(left: 12),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.primaryContainer,
              ),
              hoverColor: theme.colorScheme.surfaceContainerHighest,
              itemMargin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              iconTheme: IconThemeData(
                color: theme.colorScheme.onSurfaceVariant,
                size: 24,
              ),
              selectedIconTheme: IconThemeData(
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                border: Border(
                  right: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
              ),
              hoverColor: theme.colorScheme.surfaceContainerHighest,
              itemMargin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
            items: [
              SidebarXItem(
                icon: Icons.dns,
                label: 'DNS 工具',
                onTap: () => context.go('/dns'),
              ),
              SidebarXItem(
                icon: Icons.info_outline,
                label: '关于',
                onTap: () => context.go('/about'),
              ),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
