import '../datasources/remote/api_service.dart';
import '../models/order_models.dart';

abstract class OrderRepository {
  Future<Order> createOrder(OrderRequest request);
  Future<Order> getOrderStatus(String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final ApiService apiService;

  OrderRepositoryImpl({required this.apiService});

  @override
  Future<Order> createOrder(OrderRequest request) async {
    return apiService.createOrder(request);
  }

  @override
  Future<Order> getOrderStatus(String orderId) async {
    return apiService.getOrderStatus(orderId);
  }
}
