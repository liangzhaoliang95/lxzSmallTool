// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lxz Small Tool';

  @override
  String get appSubtitle => 'Cross-platform desktop toolkit';

  @override
  String get navDns => 'DNS Switcher';

  @override
  String get navAbout => 'About';

  @override
  String get navCollapse => 'Collapse';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutAuthor => 'Author';

  @override
  String get aboutCheckUpdate => 'Check Update';

  @override
  String get aboutChecking => 'Checking…';

  @override
  String get aboutLatest => 'Latest';

  @override
  String get aboutHasUpdate => 'Update Available';

  @override
  String get aboutCheckFailed => 'Check Failed';

  @override
  String aboutNewVersion(String version) {
    return 'New version v$version available';
  }

  @override
  String get aboutDownload => 'Download';

  @override
  String get aboutGithub => 'GitHub Repository';

  @override
  String get aboutAppearance => 'Appearance';

  @override
  String get themeLight => 'Light';

  @override
  String get themeAuto => 'Auto';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get langZh => '中文';

  @override
  String get langEn => 'English';

  @override
  String get dnsPageTitle => 'DNS Detection & Switch';

  @override
  String get dnsHelp =>
      'Select a network interface, then tap a preset card to switch DNS';

  @override
  String get dnsHelpTooltip => 'Help';

  @override
  String get dnsNetworkInterface => 'Network Interface';

  @override
  String get dnsRefreshTooltip => 'Refresh';

  @override
  String get dnsCurrentDns => 'Current DNS';

  @override
  String get dnsNoInterface => 'No network interface found';

  @override
  String dnsInterfaceError(String error) {
    return 'Error: $error';
  }

  @override
  String get dnsNoneSet => 'No DNS set (using system default)';

  @override
  String dnsGetFailed(String error) {
    return 'Failed to get DNS: $error';
  }

  @override
  String get dnsPresets => 'Quick Switch Presets';

  @override
  String get dnsActive => 'Active';

  @override
  String get dnsSwitch => 'Switch';

  @override
  String get dnsSwitchSuccess => 'DNS switched successfully';

  @override
  String get dnsSelectInterface => 'Please select a network interface first';

  @override
  String get dnsNeedAdmin =>
      'Administrator privileges required, please run as administrator';

  @override
  String get dnsSwitchFailed => 'Switch failed';

  @override
  String dnsSwitchFailedWithError(String error) {
    return 'Switch failed: $error';
  }

  @override
  String dnsLoadFailed(String error) {
    return 'Load failed: $error';
  }

  @override
  String get dnsPresetAliName => 'Ali DNS';

  @override
  String get dnsPresetAliDesc => 'China optimized, fast & stable';

  @override
  String get dnsPresetTencentName => 'Tencent DNS';

  @override
  String get dnsPresetTencentDesc => 'China optimized, powered by DNSPod';

  @override
  String get dnsPresetGoogleName => 'Google DNS';

  @override
  String get dnsPresetGoogleDesc => 'Globally reliable, privacy focused';

  @override
  String get dnsPresetCloudflareName => 'Cloudflare';

  @override
  String get dnsPresetCloudflareDesc => 'Fastest public DNS';

  @override
  String get dnsPreset114Name => '114 DNS';

  @override
  String get dnsPreset114Desc => 'Popular DNS in China';

  @override
  String get dnsPresetAutoName => 'Auto (DHCP)';

  @override
  String get dnsPresetAutoDesc => 'Restore automatic DNS';
}
