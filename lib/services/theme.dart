import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:math_skill_up/core/theme/constants.dart';

final themeServiceProvider = Provider<ThemeService>((_) => ThemeService());

class ThemeService {
  late final Box<String> _box;
  static const String _boxName = "themeBox";

  Future<String> initTheme() async {
    _box = await Hive.openBox<String>(_boxName);

    if (_box.values.isEmpty) _box.add(lightMode);

    return _box.values.first;
  }

  Future<void> toggleTheme(String mode) async => await _box.put(0, mode);
}
