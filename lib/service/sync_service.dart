import 'dart:io';

abstract class SyncService {
  SyncService();

  Future<void> pull();

  Future<void> push();
}
