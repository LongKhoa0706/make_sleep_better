import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../supports/file_store.dart';
import '../obj/data.dart';
import '../supports/strings.dart';

class MainProvider extends ChangeNotifier {
  MainProvider() {
    _fileStore = const FileStore();
    _testReadFile();
  }

  void _testReadFile() async {
    print('data from file: ${await _fileStore.readData()}');
  }

  FileStore _fileStore;
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void switchBrightnessMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  Color getColorOfCycle(int cycle) {
    if (cycle >= 3 && cycle <= 6) {
      return Colors.green;
    }
    return Colors.red;
  }

  IconData getIconOfCycle(int cycle) {
    if (cycle >= 3 && cycle <= 6) {
      return Icons.sentiment_satisfied;
    }
    return Icons.sentiment_dissatisfied;
  }

  String getSuggest(int cycle, int delayMinute) {
    return '${Strings.suggest_cycle[cycle - 1]} - '
        '${Strings.time_cycle[cycle - 1]} + ${delayMinute}p';
  }

  Future<File> addData(DateTime time) async {
    return await _fileStore.addData(time);
  }
}
