import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../core/providers/locale_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../update/providers/update_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  static const _author = 'liangzhaoliang95';
  static const _githubUrl = 'https://github.com/liangzhaoliang95/lxzSmallTool';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final updateState = ref.watch(updateProvider);

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
                Image.asset('assets/app_icon.png', width: 80, height: 80),
                const SizedBox(height: 20),
                Text(
                  l10n.appTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.appSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                _InfoCard(
                  updateState: updateState,
                  author: _author,
                  onCheckUpdate: () =>
                      ref.read(updateProvider.notifier).checkForUpdate(),
                ),
                if (updateState.status == UpdateStatus.hasUpdate) ...[
                  const SizedBox(height: 12),
                  _UpdateBanner(state: updateState),
                ],
                const SizedBox(height: 16),
                _ThemeModeSelector(
                  current: ref.watch(themeModeProvider),
                  onChanged: (mode) =>
                      ref.read(themeModeProvider.notifier).setThemeMode(mode),
                ),
                const SizedBox(height: 12),
                _LanguageSelector(
                  current: ref.watch(localeProvider),
                  onChanged: (locale) =>
                      ref.read(localeProvider.notifier).setLocale(locale),
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

class _InfoCard extends StatelessWidget {
  final UpdateState updateState;
  final String author;
  final VoidCallback onCheckUpdate;

  const _InfoCard({
    required this.updateState,
    required this.author,
    required this.onCheckUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final version = updateState.currentVersion.isEmpty
        ? '-'
        : updateState.currentVersion;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  l10n.aboutVersion,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  version,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                _UpdateStatusChip(state: updateState),
                const Spacer(),
                _CheckUpdateButton(
                  state: updateState,
                  onTap: onCheckUpdate,
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
            color: theme.colorScheme.outlineVariant,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.aboutAuthor,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  author,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UpdateStatusChip extends StatelessWidget {
  final UpdateState state;
  const _UpdateStatusChip({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return switch (state.status) {
      UpdateStatus.checking => SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      UpdateStatus.upToDate => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline,
                size: 14, color: theme.colorScheme.primary),
            const SizedBox(width: 4),
            Text(l10n.aboutLatest,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                )),
          ],
        ),
      UpdateStatus.hasUpdate => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_circle_up_outlined,
                size: 14, color: theme.colorScheme.error),
            const SizedBox(width: 4),
            Text(l10n.aboutHasUpdate,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                )),
          ],
        ),
      UpdateStatus.error => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: 14, color: theme.colorScheme.error),
            const SizedBox(width: 4),
            Text(l10n.aboutCheckFailed,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                )),
          ],
        ),
      UpdateStatus.idle => const SizedBox.shrink(),
    };
  }
}

class _CheckUpdateButton extends StatelessWidget {
  final UpdateState state;
  final VoidCallback onTap;
  const _CheckUpdateButton({required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isChecking = state.status == UpdateStatus.checking;
    return TextButton(
      onPressed: isChecking ? null : onTap,
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      child: Text(isChecking ? l10n.aboutChecking : l10n.aboutCheckUpdate),
    );
  }
}

class _UpdateBanner extends StatelessWidget {
  final UpdateState state;
  const _UpdateBanner({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final latest = state.latestRelease!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.system_update_outlined,
              size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.aboutNewVersion(latest.version),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          TextButton(
            onPressed: () => launchUrl(
              Uri.parse(latest.releaseUrl),
              mode: LaunchMode.externalApplication,
            ),
            child: Text(l10n.aboutDownload),
          ),
        ],
      ),
    );
  }
}

class _ThemeModeSelector extends StatelessWidget {
  final ThemeMode current;
  final ValueChanged<ThemeMode> onChanged;

  const _ThemeModeSelector({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.aboutAppearance,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                value: ThemeMode.light,
                icon: const Icon(Icons.light_mode_outlined, size: 18),
                label: Text(l10n.themeLight),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                icon: const Icon(Icons.brightness_auto_outlined, size: 18),
                label: Text(l10n.themeAuto),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: const Icon(Icons.dark_mode_outlined, size: 18),
                label: Text(l10n.themeDark),
              ),
            ],
            selected: {current},
            onSelectionChanged: (set) => onChanged(set.first),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  final Locale current;
  final ValueChanged<Locale> onChanged;

  const _LanguageSelector({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.language,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SegmentedButton<Locale>(
            segments: [
              ButtonSegment(
                value: const Locale('zh'),
                label: Text(l10n.langZh),
              ),
              ButtonSegment(
                value: const Locale('en'),
                label: Text(l10n.langEn),
              ),
            ],
            selected: {current},
            onSelectionChanged: (set) => onChanged(set.first),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
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
    final l10n = AppLocalizations.of(context);

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        icon: const Icon(Icons.code),
        label: Text(l10n.aboutGithub),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
    );
  }
}
