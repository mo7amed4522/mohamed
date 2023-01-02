// ignore_for_file: prefer_const_declarations, depend_on_referenced_packages

import 'dart:developer';
import 'package:win32/win32.dart' as win32;
import 'package:path/path.dart' as p;
import 'package:ffi/ffi.dart';

abstract class IShellExecute {
  Future<bool> openFile(String path);
  Future<bool> openDirectory(String path);
}

class ShellExecuteService extends IShellExecute {
  @override
  Future<bool> openDirectory(String path) async {
    try {
      final lpOperation = 'explore'.toNativeUtf16();
      final lpFile = path.toNativeUtf16();
      final lpParameters = ''.toNativeUtf16();
      final lpDirectory = ''.toNativeUtf16();
      final nShowCmd = win32.SW_SHOW;
      final value = win32.ShellExecute(
        0,
        lpOperation,
        lpFile,
        lpParameters,
        lpDirectory,
        nShowCmd,
      );
      bool success = value > 32;
      return success;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  @override
  Future<bool> openFile(String path) async {
    try {
      final lpOperation = 'open'.toNativeUtf16();
      final lpFile = p.basename(path).toNativeUtf16();
      final lpParameters = ''.toNativeUtf16();
      final lpDirectory = p.basename(path).toNativeUtf16();
      final nShowCmd = win32.SW_SHOW;
      final value = win32.ShellExecute(
        0,
        lpOperation,
        lpFile,
        lpParameters,
        lpDirectory,
        nShowCmd,
      );
      bool success = value > 32;
      return success;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
