import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In zh, this message translates to:
  /// **'lxz小工具'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'跨平台桌面小工具集'**
  String get appSubtitle;

  /// No description provided for @navDns.
  ///
  /// In zh, this message translates to:
  /// **'DNS快速切换'**
  String get navDns;

  /// No description provided for @navAbout.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get navAbout;

  /// No description provided for @navCollapse.
  ///
  /// In zh, this message translates to:
  /// **'收起'**
  String get navCollapse;

  /// No description provided for @aboutVersion.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get aboutVersion;

  /// No description provided for @aboutAuthor.
  ///
  /// In zh, this message translates to:
  /// **'作者'**
  String get aboutAuthor;

  /// No description provided for @aboutCheckUpdate.
  ///
  /// In zh, this message translates to:
  /// **'检查更新'**
  String get aboutCheckUpdate;

  /// No description provided for @aboutChecking.
  ///
  /// In zh, this message translates to:
  /// **'检查中…'**
  String get aboutChecking;

  /// No description provided for @aboutLatest.
  ///
  /// In zh, this message translates to:
  /// **'最新'**
  String get aboutLatest;

  /// No description provided for @aboutHasUpdate.
  ///
  /// In zh, this message translates to:
  /// **'有新版本'**
  String get aboutHasUpdate;

  /// No description provided for @aboutCheckFailed.
  ///
  /// In zh, this message translates to:
  /// **'检查失败'**
  String get aboutCheckFailed;

  /// No description provided for @aboutNewVersion.
  ///
  /// In zh, this message translates to:
  /// **'发现新版本 v{version}'**
  String aboutNewVersion(String version);

  /// No description provided for @aboutDownload.
  ///
  /// In zh, this message translates to:
  /// **'前往下载'**
  String get aboutDownload;

  /// No description provided for @aboutGithub.
  ///
  /// In zh, this message translates to:
  /// **'GitHub 开源地址'**
  String get aboutGithub;

  /// No description provided for @aboutAppearance.
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get aboutAppearance;

  /// No description provided for @themeLight.
  ///
  /// In zh, this message translates to:
  /// **'明亮'**
  String get themeLight;

  /// No description provided for @themeAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get themeAuto;

  /// No description provided for @themeDark.
  ///
  /// In zh, this message translates to:
  /// **'暗黑'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// No description provided for @langZh.
  ///
  /// In zh, this message translates to:
  /// **'中文'**
  String get langZh;

  /// No description provided for @langEn.
  ///
  /// In zh, this message translates to:
  /// **'English'**
  String get langEn;

  /// No description provided for @dnsPageTitle.
  ///
  /// In zh, this message translates to:
  /// **'DNS 检测与切换'**
  String get dnsPageTitle;

  /// No description provided for @dnsHelp.
  ///
  /// In zh, this message translates to:
  /// **'选择网络接口后，点击预设卡片即可快速切换 DNS'**
  String get dnsHelp;

  /// No description provided for @dnsHelpTooltip.
  ///
  /// In zh, this message translates to:
  /// **'帮助'**
  String get dnsHelpTooltip;

  /// No description provided for @dnsNetworkInterface.
  ///
  /// In zh, this message translates to:
  /// **'网络接口'**
  String get dnsNetworkInterface;

  /// No description provided for @dnsRefreshTooltip.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get dnsRefreshTooltip;

  /// No description provided for @dnsCurrentDns.
  ///
  /// In zh, this message translates to:
  /// **'当前 DNS'**
  String get dnsCurrentDns;

  /// No description provided for @dnsNoInterface.
  ///
  /// In zh, this message translates to:
  /// **'未找到网络接口'**
  String get dnsNoInterface;

  /// No description provided for @dnsInterfaceError.
  ///
  /// In zh, this message translates to:
  /// **'错误: {error}'**
  String dnsInterfaceError(String error);

  /// No description provided for @dnsNoneSet.
  ///
  /// In zh, this message translates to:
  /// **'未设置 DNS（使用系统默认）'**
  String get dnsNoneSet;

  /// No description provided for @dnsGetFailed.
  ///
  /// In zh, this message translates to:
  /// **'获取失败: {error}'**
  String dnsGetFailed(String error);

  /// No description provided for @dnsPresets.
  ///
  /// In zh, this message translates to:
  /// **'快速切换预设'**
  String get dnsPresets;

  /// No description provided for @dnsActive.
  ///
  /// In zh, this message translates to:
  /// **'已激活'**
  String get dnsActive;

  /// No description provided for @dnsSwitch.
  ///
  /// In zh, this message translates to:
  /// **'切换'**
  String get dnsSwitch;

  /// No description provided for @dnsSwitchSuccess.
  ///
  /// In zh, this message translates to:
  /// **'DNS 切换成功'**
  String get dnsSwitchSuccess;

  /// No description provided for @dnsSelectInterface.
  ///
  /// In zh, this message translates to:
  /// **'请先选择网络接口'**
  String get dnsSelectInterface;

  /// No description provided for @dnsNeedAdmin.
  ///
  /// In zh, this message translates to:
  /// **'需要管理员权限，请以管理员身份运行应用'**
  String get dnsNeedAdmin;

  /// No description provided for @dnsSwitchFailed.
  ///
  /// In zh, this message translates to:
  /// **'切换失败'**
  String get dnsSwitchFailed;

  /// No description provided for @dnsSwitchFailedWithError.
  ///
  /// In zh, this message translates to:
  /// **'切换失败: {error}'**
  String dnsSwitchFailedWithError(String error);

  /// No description provided for @dnsLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载失败: {error}'**
  String dnsLoadFailed(String error);

  /// No description provided for @dnsPresetAliName.
  ///
  /// In zh, this message translates to:
  /// **'阿里 DNS'**
  String get dnsPresetAliName;

  /// No description provided for @dnsPresetAliDesc.
  ///
  /// In zh, this message translates to:
  /// **'国内优化，快速稳定'**
  String get dnsPresetAliDesc;

  /// No description provided for @dnsPresetTencentName.
  ///
  /// In zh, this message translates to:
  /// **'腾讯 DNS'**
  String get dnsPresetTencentName;

  /// No description provided for @dnsPresetTencentDesc.
  ///
  /// In zh, this message translates to:
  /// **'国内优化，DNSPod 提供'**
  String get dnsPresetTencentDesc;

  /// No description provided for @dnsPresetGoogleName.
  ///
  /// In zh, this message translates to:
  /// **'Google DNS'**
  String get dnsPresetGoogleName;

  /// No description provided for @dnsPresetGoogleDesc.
  ///
  /// In zh, this message translates to:
  /// **'全球可靠，隐私保护'**
  String get dnsPresetGoogleDesc;

  /// No description provided for @dnsPresetCloudflareName.
  ///
  /// In zh, this message translates to:
  /// **'Cloudflare'**
  String get dnsPresetCloudflareName;

  /// No description provided for @dnsPresetCloudflareDesc.
  ///
  /// In zh, this message translates to:
  /// **'最快的公共 DNS'**
  String get dnsPresetCloudflareDesc;

  /// No description provided for @dnsPreset114Name.
  ///
  /// In zh, this message translates to:
  /// **'114 DNS'**
  String get dnsPreset114Name;

  /// No description provided for @dnsPreset114Desc.
  ///
  /// In zh, this message translates to:
  /// **'国内常用 DNS'**
  String get dnsPreset114Desc;

  /// No description provided for @dnsPresetAutoName.
  ///
  /// In zh, this message translates to:
  /// **'自动(DHCP)'**
  String get dnsPresetAutoName;

  /// No description provided for @dnsPresetAutoDesc.
  ///
  /// In zh, this message translates to:
  /// **'恢复自动获取'**
  String get dnsPresetAutoDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
