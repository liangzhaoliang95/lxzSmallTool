import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const _version = '1.0.11';
  static const _buildTime = '2026-03-19';
  static const _author = 'liangzhaoliang95';
  static const _githubUrl = 'https://github.com/liangzhaoliang95/plasoSmallTool';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/app_icon.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  '伯索小工具',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '跨平台桌面小工具集',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                _InfoCard(
                  items: [
                    _InfoItem(label: '版本', value: _version),
                    _InfoItem(label: '构建时间', value: _buildTime),
                    _InfoItem(label: '作者', value: _author),
                  ],
                ),
                const SizedBox(height: 24),
                _GithubButton(url: _githubUrl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoItem {
  final String label;
  final String value;
  const _InfoItem({required this.label, required this.value});
}

class _InfoCard extends StatelessWidget {
  final List<_InfoItem> items;
  const _InfoCard({required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final isLast = entry.key == items.length - 1;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.value.label,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      entry.value.value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  color: theme.colorScheme.outlineVariant,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _GithubButton extends StatelessWidget {
  final String url;
  const _GithubButton({required this.url});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _openUrl(url),
        icon: const Icon(Icons.code),
        label: const Text('GitHub 开源地址'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
    );
  }

  void _openUrl(String url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
