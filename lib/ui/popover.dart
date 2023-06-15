import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/gen/native_serial_port.dart';
import 'package:fterm/ui/connector/connector.dart';
import 'package:fterm/ui/connector/local_connector.dart';
import 'package:fterm/ui/connector/ssh_connector.dart';

import '../bloc/home_tab_bloc.dart';
import '../bloc/shells_cubit.dart';
import '../di/di.dart';
import '../model/shell.dart';
import '../model/ssh_config.dart';
import 'terminal_panel.dart';

mixin ProfilesPop {
  Future<Connector?> showProfilesPop(BuildContext context,
      {ThemeData? themeData}) {
    var themeData2 = themeData ?? ThemeData.dark(useMaterial3: true);
    showDialog(
      context: context,
      builder: (c) => Dialog(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth / 2.5,
            height: constraints.maxHeight / 1.1,
            child: _buildChild(themeData2),
          );
        }),
      ),
    );
    return Future(() => null);
    //   return showPopover(
    //       context: context,
    //       bodyBuilder: (context) {
    //         return _buildChild(themeData2);
    //       },
    //       onPop: () => print('Popover was popped!'),
    //       direction: PopoverDirection.bottom,
    //       width: 300,
    //       height: 400,
    //       arrowHeight: 5,
    //       arrowWidth: 7,
    //       // barrierColor: Colors.transparent,
    //       transitionDuration: const Duration(milliseconds: 50));
    // }
  }
}

Widget _buildChild(ThemeData themeData2) {
  return Theme(
    data: themeData2,
    child: const Material(
      child: PopContent(),
    ),
  );
}

class PopContent extends StatelessWidget {
  const PopContent({Key? key}) : super(key: key);

  Widget _buildPanel(BuildContext context) {
    var bloc = getIt<HomeTabBloc>();
    return BlocBuilder<ProfilesSearchCubit, ProfilesState>(
      builder: (context, state) {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            getIt<ProfilesSearchCubit>().expanded(index, !isExpanded);
          },
          children: [
            ...state.items.map<ExpansionPanel>((e) {
              return e.map(
                  hosts: (v) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) => ListTile(
                          title: Text(v.header),
                        ),
                        body: Column(
                          children: v.hosts
                              .toList()
                              .where(
                                (value) =>
                                    state.keyword.trim().isEmpty ||
                                    value.title.contains(state.keyword),
                              )
                              .map((e) => _buildSSH(e, bloc, context))
                              .toList(),
                        ),
                        isExpanded: e.isExpanded,
                      ),
                  shells: (v) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) => ListTile(
                          title: Text(v.header),
                        ),
                        body: Column(
                          children: v.shells
                              .toList()
                              .where(
                                (value) =>
                                    state.keyword.trim().isEmpty ||
                                    value.cmd.contains(state.keyword),
                              )
                              .map((e) => _buildShell(e, bloc, context))
                              .toList(),
                        ),
                        isExpanded: e.isExpanded,
                      ),
                  serialPorts: (v) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) => ListTile(
                          title: Text(v.header),
                        ),
                        body: Column(
                          children: v.ports
                              .toList()
                              .where(
                                (value) =>
                                    state.keyword.trim().isEmpty ||
                                    value.portName.contains(state.keyword),
                              )
                              .map((e) => _buildPort(e, bloc, context))
                              .toList(),
                        ),
                        isExpanded: e.isExpanded,
                      ));
            }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (v) {
              context.read<ProfilesSearchCubit>().search(v);
            },
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: _buildPanel(context),
          ),
        ),
      ],
    );
  }

  Widget _buildShell(Shell e, HomeTabBloc bloc, BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0)
          .copyWith(left: 30),
      // leading: const Icon(Icons.settings),
      title: Text(e.title),
      leading: const Icon(Icons.terminal),
      onTap: () {
        var connector = LocalConnector(shell: e);
        bloc.add(
          HomeTabEvent.add(
            TerminalTab(connector.executable, connector),
          ),
        );
        Navigator.pop(context, connector);
      },
    );
  }

  Widget _buildSSH(SSHConfig e, HomeTabBloc bloc, BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16).copyWith(left: 30),
      // leading: const Icon(Icons.settings),
      title: Text(e.title),
      subtitle: Text("${e.username}@${e.host}:${e.port}"),
      leading: const Icon(Icons.computer),
      onTap: () {
        bloc.add(
          HomeTabEvent.add(
            TerminalTab(e.title, SSHConnector(e)),
          ),
        );
        Navigator.pop(context, SSHConnector(e));
      },
    );
  }

  Widget _buildPort(SerialPortInfo e, HomeTabBloc bloc, BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16).copyWith(left: 30),
      // leading: const Icon(Icons.settings),
      title: Text(e.portName),
      subtitle: Text(e.portType.map(usbPort: (v) {
        return "USB";
      }, pciPort: (v) {
        return "pci";
      }, bluetoothPort: (v) {
        return "bt";
      }, unknown: (v) {
        return "unknown";
      })),
      leading: const Icon(Icons.computer),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
