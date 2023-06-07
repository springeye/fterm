import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bootstrap/launcher.dart';
import 'package:fterm/bootstrap/options.dart';
import 'package:fterm/bootstrap/runner.dart';

Future<void> main(List<String> arguments) async {
  print("arguments==>$arguments");
  Bloc.observer = _AppBlocObserver();
  AppRunner.run(
    Launcher(),
    () => Future.value(const LaunchOptions()),
  );
}

class _AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("_AppBlocObserver：    $event");
    // if (bloc is SshConfigBloc) {
    //   getIt<SshSearchCubit>().load();
    // }
  }
}
