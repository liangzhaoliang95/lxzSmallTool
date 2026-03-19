// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'lxz小工具';

  @override
  String get appSubtitle => '跨平台桌面小工具集';

  @override
  String get navDns => 'DNS快速切换';

  @override
  String get navAbout => '关于';

  @override
  String get navCollapse => '收起';

  @override
  String get aboutVersion => '版本';

  @override
  String get aboutAuthor => '作者';

  @override
  String get aboutCheckUpdate => '检查更新';

  @override
  String get aboutChecking => '检查中…';

  @override
  String get aboutLatest => '最新';

  @override
  String get aboutHasUpdate => '有新版本';

  @override
  String get aboutCheckFailed => '检查失败';

  @override
  String aboutNewVersion(String version) {
    return '发现新版本 v$version';
  }

  @override
  String get aboutDownload => '前往下载';

  @override
  String get aboutGithub => 'GitHub 开源地址';

  @override
  String get aboutAppearance => '外观';

  @override
  String get themeLight => '明亮';

  @override
  String get themeAuto => '自动';

  @override
  String get themeDark => '暗黑';

  @override
  String get language => '语言';

  @override
  String get langZh => '中文';

  @override
  String get langEn => 'English';

  @override
  String get dnsPageTitle => 'DNS 检测与切换';

  @override
  String get dnsHelp => '选择网络接口后，点击预设卡片即可快速切换 DNS';

  @override
  String get dnsHelpTooltip => '帮助';

  @override
  String get dnsNetworkInterface => '网络接口';

  @override
  String get dnsRefreshTooltip => '刷新';

  @override
  String get dnsCurrentDns => '当前 DNS';

  @override
  String get dnsNoInterface => '未找到网络接口';

  @override
  String dnsInterfaceError(String error) {
    return '错误: $error';
  }

  @override
  String get dnsNoneSet => '未设置 DNS（使用系统默认）';

  @override
  String dnsGetFailed(String error) {
    return '获取失败: $error';
  }

  @override
  String get dnsPresets => '快速切换预设';

  @override
  String get dnsActive => '已激活';

  @override
  String get dnsSwitch => '切换';

  @override
  String get dnsSwitchSuccess => 'DNS 切换成功';

  @override
  String get dnsSelectInterface => '请先选择网络接口';

  @override
  String get dnsNeedAdmin => '需要管理员权限，请以管理员身份运行应用';

  @override
  String get dnsSwitchFailed => '切换失败';

  @override
  String dnsSwitchFailedWithError(String error) {
    return '切换失败: $error';
  }

  @override
  String dnsLoadFailed(String error) {
    return '加载失败: $error';
  }

  @override
  String get dnsPresetAliName => '阿里 DNS';

  @override
  String get dnsPresetAliDesc => '国内优化，快速稳定';

  @override
  String get dnsPresetTencentName => '腾讯 DNS';

  @override
  String get dnsPresetTencentDesc => '国内优化，DNSPod 提供';

  @override
  String get dnsPresetGoogleName => 'Google DNS';

  @override
  String get dnsPresetGoogleDesc => '全球可靠，隐私保护';

  @override
  String get dnsPresetCloudflareName => 'Cloudflare';

  @override
  String get dnsPresetCloudflareDesc => '最快的公共 DNS';

  @override
  String get dnsPreset114Name => '114 DNS';

  @override
  String get dnsPreset114Desc => '国内常用 DNS';

  @override
  String get dnsPresetAutoName => '自动(DHCP)';

  @override
  String get dnsPresetAutoDesc => '恢复自动获取';
}
