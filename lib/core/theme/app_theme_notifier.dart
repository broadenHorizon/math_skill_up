import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:math_skill_up/core/theme/constants.dart';

part 'app_theme_notifier.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  late final Box<String> _box;
  static const String _boxName = "themeBox";
  late String _currentMode;

  String get currentMode => _currentMode;

  @override
  Future<String> build() async {
    return await _initTheme();
  }

  Future<String> _initTheme() async {
    _box = await Hive.openBox<String>(_boxName);

    if (_box.values.isEmpty) await _box.add(lightMode);

    _currentMode = _box.values.first;
    return _currentMode;
  }

  Future<void> _updateTheme(String mode) async => await _box.put(0, mode);

  void toggle() async {
    final newMode = currentMode == lightMode ? darkMode : lightMode;

    _currentMode = newMode;
    state = AsyncValue.data(newMode);

    _updateTheme(newMode);
  }
}
