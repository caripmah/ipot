import 'package:dio/dio.dart';
import '../../models/menu_models.dart';
import '../../models/order_models.dart';
import '../../../core/utils/app_logger.dart';

// ─── Shared exception ─────────────────────────────────────────────────────────

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

// ─── Abstract contract ────────────────────────────────────────────────────────
// Both MockApiService and RealApiService implement this.
// Repositories only depend on this abstract class — never on a concrete impl.

abstract class ApiService {
  Future<MenuResponse> getMenu(String tableId);
  Future<Order> createOrder(OrderRequest request);
  Future<Order> getOrderStatus(String orderId);
}

// ─── Real implementation (Dio) ────────────────────────────────────────────────

class RealApiService implements ApiService {
  final Dio _dio;

  RealApiService(this._dio);

  @override
  Future<MenuResponse> getMenu(String tableId) async {
    try {
      final response = await _dio.get(
        '/api/v1/menu',
        queryParameters: {'table_id': tableId},
      );
      return MenuResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Order> createOrder(OrderRequest request) async {
    try {
      final response = await _dio.post(
        '/api/v1/orders',
        data: request.toJson(),
      );
      return Order.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Order> getOrderStatus(String orderId) async {
    try {
      final response = await _dio.get('/api/v1/orders/$orderId');
      return Order.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ApiException _handleDioError(DioException e) {
    AppLogger.e('API error', e);
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException(
            message: 'Connection timed out. Please check your internet.');
      case DioExceptionType.connectionError:
        return const ApiException(message: 'No internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message =
            e.response?.data?['message'] as String? ?? 'Server error';
        return ApiException(message: message, statusCode: statusCode);
      default:
        return ApiException(
            message: e.message ?? 'Unexpected error occurred.');
    }
  }
}
