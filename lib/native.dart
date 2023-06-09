import 'dart:ffi';

import 'dart:io' as io;

import 'bridge_generated.dart';

const _base = 'rust_ffi';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final _dylib = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';

final api = RustFfiImpl(io.Platform.isIOS || io.Platform.isMacOS
    ? DynamicLibrary.executable()
    : DynamicLibrary.open(_dylib));
//@executable_path/../Frameworks/
