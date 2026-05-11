import '../../data/datasources/remote/api_service.dart';
import '../../data/models/order_models.dart';

abstract class OrderRepository {
  Future<Order> createOrder(OrderRequest request);
  Future<Order> getOrderStatus(String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final ApiService _apiService;

  OrderRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Order> createOrder(OrderRequest request) =>
      _apiService.createOrder(request);

  @override
  Future<Order> getOrderStatus(String orderId) =>
      _apiService.getOrderStatus(orderId);
}
