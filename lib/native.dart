import 'dart:ffi';
import 'dart:io' as io;
import 'dart:isolate';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

import 'bridge_generated.dart';

const _base = 'rust_ffi';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final _dylib = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';

//@executable_path/../Frameworks/
class Native2Api {
  final String? path;
  final RustFfi _api;

  Native2Api({this.path})
      : _api = RustFfiImpl(io.Platform.isIOS || io.Platform.isMacOS
            ? DynamicLibrary.executable()
            : DynamicLibrary.open(_dylib));

  Stream<String> query() {
    return _api.query();
  }
}
