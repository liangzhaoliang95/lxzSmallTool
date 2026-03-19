import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/release_info.dart';

class GithubReleaseService {
  static const _apiUrl =
      'https://api.github.com/repos/liangzhaoliang95/lxzSmallTool/releases/latest';

  Future<ReleaseInfo> fetchLatestRelease() async {
    final response = await http.get(
      Uri.parse(_apiUrl),
      headers: {'Accept': 'application/vnd.github+json'},
    );

    if (response.statusCode != 200) {
      throw Exception('获取版本信息失败: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final tag = (json['tag_name'] as String).replaceFirst('v', '');

    return ReleaseInfo(
      version: tag,
      releaseUrl: json['html_url'] as String,
      body: json['body'] as String? ?? '',
    );
  }
}
