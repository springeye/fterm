
import 'dart:ffi';
import 'dart:io' as io;
import './generated_bindings.dart';
const _base = 'rust_ffi';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final _dylib = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';


//@executable_path/../Frameworks/
class Native2Api{
  final String? path;
  final NativeLibrary _api;
  Native2Api({this.path}):_api=NativeLibrary(io.Platform.isIOS || io.Platform.isMacOS
      ? DynamicLibrary.executable()
      : DynamicLibrary.open(_dylib));
    getConnect() async {
      var conp= _api.test();
      _api.test2(conp);
  }

}