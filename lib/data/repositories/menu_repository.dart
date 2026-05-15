import 'package:hive_flutter/hive_flutter.dart';
import '../datasources/remote/api_service.dart';
import '../datasources/local/menu_dummy_data.dart';
import '../models/menu_models.dart';

abstract class MenuRepository {
  Future<MenuResponse> getMenu(String tableId);
}

class MenuRepositoryImpl implements MenuRepository {
  final ApiService apiService;
  final Box cacheBox;

  MenuRepositoryImpl({
    required this.apiService,
    required this.cacheBox,
  });

  @override
  Future<MenuResponse> getMenu(String tableId) async {
    try {
      final response = await apiService.getMenu(tableId);
      // Optional: cache the response
      await cacheBox.put('last_menu_$tableId', response.toJson());
      return response;
    } catch (e) {
      // Try to get from cache if offline
      final cachedData = cacheBox.get('last_menu_$tableId');
      if (cachedData != null) {
        return MenuResponse.fromJson(Map<String, dynamic>.from(cachedData));
      }

      // Final fallback: Use hardcoded dummy data if no cache exists
      // (This ensures the app works even on the very first offline scan)
      final fallbackData = Map<String, dynamic>.from(menuDummyData);
      final restaurant = Map<String, dynamic>.from(fallbackData['restaurant'] as Map);
      restaurant['table_id'] = tableId;
      fallbackData['restaurant'] = restaurant;
      
      return MenuResponse.fromJson(fallbackData);
    }
  }
}
