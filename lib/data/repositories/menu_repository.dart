import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/datasources/remote/api_service.dart';
import '../../data/models/menu_models.dart';
import '../../core/utils/app_logger.dart';

abstract class MenuRepository {
  Future<MenuResponse> getMenu(String tableId);
}

class MenuRepositoryImpl implements MenuRepository {
  final ApiService _apiService;
  final Box _cacheBox;

  MenuRepositoryImpl({
    required ApiService apiService,
    required Box cacheBox,
  })  : _apiService = apiService,
        _cacheBox = cacheBox;

  static const _cachePrefix = 'menu_';
  static const _cacheDuration = Duration(minutes: 30);

  @override
  Future<MenuResponse> getMenu(String tableId) async {
    // Try network first
    try {
      final response = await _apiService.getMenu(tableId);
      _saveToCache(tableId, response);
      return response;
    } on ApiException catch (e) {
      AppLogger.warning('Network failed, trying cache: ${e.message}');
      // Fall back to cache on network error
      final cached = _loadFromCache(tableId);
      if (cached != null) return cached;
      rethrow;
    }
  }

  void _saveToCache(String tableId, MenuResponse response) {
    try {
      _cacheBox.put('$_cachePrefix$tableId', {
        'data': jsonEncode(response.toJson()),
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      AppLogger.warning('Cache save failed: $e');
    }
  }

  MenuResponse? _loadFromCache(String tableId) {
    try {
      final cached = _cacheBox.get('$_cachePrefix$tableId') as Map?;
      if (cached == null) return null;

      final timestamp = cached['timestamp'] as int;
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > _cacheDuration.inMilliseconds) return null;

      final json = jsonDecode(cached['data'] as String) as Map<String, dynamic>;
      return MenuResponse.fromJson(json);
    } catch (e) {
      AppLogger.warning('Cache read failed: $e');
      return null;
    }
  }
}
