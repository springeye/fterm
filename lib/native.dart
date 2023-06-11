import 'dart:ffi';

import 'dart:io' as io;

import 'bridge_definitions.dart';
import 'bridge_generated.dart';

const _base = 'rust_ffi';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final _dylib = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';


//@executable_path/../Frameworks/
class NativeApi{
  final RustFfiImpl _api;
  final String? path;
  NativeApi({this.path}):_api=RustFfiImpl(io.Platform.isIOS || io.Platform.isMacOS
      ? DynamicLibrary.executable()
      : DynamicLibrary.open(_dylib));
  Future<List<Host>> findAll() async {
    return await _api.findAll(path:path);
  }
  Future<int> insert(Host host) async {
    return await _api.insert(path:path, host: host);
  }
  Future<int> update(Host host) async {
    return await _api.update(path:path, host: host);
  }
  Future<int> delete(String id) async {
    return await _api.delete(path:path,id: id);
  }
}