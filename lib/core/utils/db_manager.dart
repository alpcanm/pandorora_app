import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager {
  Box<String>? _box;
  final String key;
  ICacheManager(this.key);
  Future<void> init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<String>(key);
    }
  }

  Box<String>? get box => _box;
  Iterable<String>? getValues();
  String? getAValue(String key);
  Future<void> addToBox(String value);
  Future<void> putToBox(String key, String value);
  bool? isNotEmpty();
  Future<void> clearBox() async {
    await _box?.clear();
  }
}

class CacheManager extends ICacheManager {
  CacheManager(String key) : super(key);

  @override
  Future<void> addToBox(String value) async {
    await _box?.add(value);
  }

  @override
  Future<void> putToBox(String key, String value) async {
    await _box?.put(key, value);
  }

  @override
  Iterable<String>? getValues() {
    return _box?.values;
  }

  @override
  bool? isNotEmpty() {
    return _box?.isNotEmpty;
  }

  @override
  String? getAValue(String key) {
    return _box?.get(key);
  }
}
