
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/di/di.dart';
import 'package:xterm/xterm.dart';



class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ThemePageNavigator(
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }
}

class _ThemePageNavigator extends StatelessWidget {
  const _ThemePageNavigator({Key? key, required this.navigatorKey})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings routeSettings) {
          return FluentPageRoute(
              settings: routeSettings,
              builder: (context) {
                return getPage(routeSettings.name);
              });
        });
  }

  Widget getPage(String? url) {
    switch (url) {
      case "/color":
        return const _ColorConfigPage();
      case "/":
      default:
        return const _ColorListPage();
    }
  }
}

class _ColorListPage extends StatefulWidget {
  const _ColorListPage({Key? key}) : super(key: key);

  @override
  State<_ColorListPage> createState() => _ColorListPageState();
}

extension aaa<E> on List<E> {
  filter(bool Function(E element) test) {
    return where((element) => !test(element));
  }
}

class _ColorListPageState extends State<_ColorListPage> {
  String kw = "";

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var current = configState.currentColor;
    var currentName = configState.currentColorName;
    var s = configState.colorSchemes;
    return ScaffoldPage(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "当前：$currentName",
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 130,
                    child: _buildPreviewView(current),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextBox(
                prefix: const Icon(FluentIcons.search),
                placeholder: "搜索配色方案",
                onChanged: (v) {
                  setState(() {
                    kw = v;
                  });
                },
              ),
            ),
            ...s.entries
                .where((element) => element.key.contains(kw))
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: _buildColorItem(context, e, currentName),
                    ))
          ],
        ),
      ),
    );
  }

  Widget _buildColorItem(BuildContext context,
      MapEntry<String, TerminalTheme> item, String current) {
    return GestureDetector(
      onTap: () {
        getIt<AppConfigCubit>().setCurrentColorScheme(item.key);
      },
      child: Container(
        color: item.key == current ? Colors.blue : Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.key),
            SizedBox(
              width: double.maxFinite,
              height: 130,
              child: _buildPreviewView(item.value),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewView(TerminalTheme colors) {
    var textStyle = DefaultTextStyle.of(context).style.copyWith(
          backgroundColor: colors.background,
          color: colors.foreground,
        );
    return Container(
      color: colors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              // text: "user@develop-pc\$ ls ",
              style: textStyle,
              children: <TextSpan>[
                TextSpan(text: 'henjue', style: TextStyle(color: colors.green)),
                TextSpan(text: '@', style: TextStyle(color: colors.cyan)),
                TextSpan(
                    text: 'develop-pc', style: TextStyle(color: colors.blue)),
                TextSpan(
                    text: '\$',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colors.red)),
                const TextSpan(text: ' '),
                const TextSpan(text: 'ls'),
                TextSpan(
                  text: "\u00A0\u00A0",
                  style: TextStyle(
                    // color: colors.cursor,
                    background: Paint()..color = colors.red,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-rwxr-xr-x 1 root ",
              style: textStyle,
              children: [
                TextSpan(
                  text: "Documents",
                  style: TextStyle(
                    color: colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-rwxr-xr-x 1 root ",
              style: textStyle,
              children: [
                TextSpan(
                  text: "Downlodas",
                  style: TextStyle(
                    color: colors.black,
                    background: Paint()..color = colors.green,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-rwxr-xr-x 1 root ",
              style: textStyle,
              children: [
                TextSpan(
                  text: "Pictures",
                  style: TextStyle(
                    color: colors.black,
                    background: Paint()..color = colors.brightBlack,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-rwxr-xr-x 1 root ",
              style: textStyle,
              children: [
                TextSpan(
                  text: "Music",
                  style: TextStyle(
                    color: colors.black,
                    background: Paint()..color = colors.brightBlue,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-rwxr-xr-x 1 root ",
              style: textStyle,
              children: [
                TextSpan(
                  text: "実行可能ファイル",
                  style: TextStyle(
                    color: colors.green,
                  ),
                ),
              ],
            ),
          ),
          // RichText(
          //   text: TextSpan(
          //     text: "-rwxr-xr-x 1 root ",
          //     style: textStyle,
          //     children: [
          //       TextSpan(
          //         text: "sym ",
          //         style: TextStyle(
          //           color: colors.cyan,
          //         ),
          //       ),
          //       const TextSpan(
          //         text: "->",
          //       ),
          //       TextSpan(
          //         text: " link",
          //         style: TextStyle(
          //           color: colors.red,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // RichText(
          //   text: TextSpan(
          //     style: textStyle,
          //     children: [
          //       TextSpan(
          //         text: "Icons:",
          //         style: textStyle.copyWith(fontWeight: FontWeight.bold),
          //       ),
          //       TextSpan(
          //         text: "  ",
          //         style: textStyle.copyWith(
          //             fontFamily: FontFamily.mesloLGLForPowerline),
          //       ),
          //       TextSpan(
          //         text: " ",
          //         style: textStyle,
          //       ),
          //       TextSpan(
          //         text: "  Powerline ",
          //         style: TextStyle(
          //           color: colors.black,
          //           background: Paint()..color = colors.red,
          //         ),
          //       ),
          //       TextSpan(
          //         text: " ",
          //         style: TextStyle(
          //           color: colors.red,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _ColorConfigPage extends StatelessWidget {
  const _ColorConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        leading: Button(
            child: const Icon(FluentIcons.back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      content: Button(
        child: const Text("color"),
        onPressed: () {
          Navigator.of(context).pushNamed("/color");
        },
      ),
    );
  }
}
