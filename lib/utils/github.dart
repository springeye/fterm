import 'package:dio/dio.dart';

Future<Response> checkVersion() async {
  /*
  get last https://api.github.com/repos/springeye/fterm/releases/latest
   */
  BaseOptions? options = BaseOptions(
    baseUrl: "https://api.github.com/",
    headers: {
      "Accept": "application/vnd.github+json",
      "X-GitHub-Api-Version": "2022-11-28",
    },
  );
  var dio = Dio(options);
  var res = await dio.get("repos/springeye/fterm/releases/latest");
  return res;
}
