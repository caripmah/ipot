import 'dart:math';
import '../../models/menu_models.dart';
import '../../models/order_models.dart';
import '../local/menu_dummy_data.dart';
import 'api_service.dart';

/// Simulates network delay so loading states are visible during demo/testing.
const _kFakeDelay = Duration(milliseconds: 800);

/// In-memory order store so polling reflects realistic state progression.
final Map<String, _MockOrderState> _orderStore = {};

class _MockOrderState {
  Order order;
  DateTime createdAt;

  _MockOrderState({required this.order, required this.createdAt});
}

class MockApiService implements ApiService {
  @override
  Future<MenuResponse> getMenu(String tableId) async {
    await Future.delayed(_kFakeDelay);

    // Load from central dummy data
    final data = Map<String, dynamic>.from(menuDummyData);

    // Inject the dynamic tableId
    final restaurant = Map<String, dynamic>.from(data['restaurant'] as Map);
    restaurant['table_id'] = tableId;
    data['restaurant'] = restaurant;

    return MenuResponse.fromJson(data);
  }

  @override
  Future<Order> createOrder(OrderRequest request) async {
    await Future.delayed(_kFakeDelay);
// ... rest of implementation (omitted for brevity in prompt but I will keep it)

    final orderId = 'ORD-${_randomId()}';
    final order = Order(
      id: orderId,
      tableId: request.tableId,
      status: OrderStatus.pending,
      estimatedTime: 15,
      createdAt: DateTime.now().toIso8601String(),
    );

    _orderStore[orderId] = _MockOrderState(
      order: order,
      createdAt: DateTime.now(),
    );

    return order;
  }

  @override
  Future<Order> getOrderStatus(String orderId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final state = _orderStore[orderId];
    if (state == null) {
      throw const ApiException(message: 'Order not found.', statusCode: 404);
    }

    // Auto-advance status based on elapsed time (for realistic demo):
    // 0–5s   → pending
    // 5–15s  → confirmed
    // 15–35s → preparing
    // 35–50s → ready
    // 50s+   → served
    final elapsed = DateTime.now().difference(state.createdAt).inSeconds;
    final newStatus = _statusForElapsed(elapsed);

    if (newStatus != state.order.status) {
      state.order = state.order.copyWith(
        status: newStatus,
        estimatedTime: _estimatedTimeForStatus(newStatus),
      );
    }

    return state.order;
  }

  OrderStatus _statusForElapsed(int seconds) {
    if (seconds < 5) return OrderStatus.pending;
    if (seconds < 15) return OrderStatus.confirmed;
    if (seconds < 35) return OrderStatus.preparing;
    if (seconds < 50) return OrderStatus.ready;
    return OrderStatus.served;
  }

  int? _estimatedTimeForStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 15;
      case OrderStatus.confirmed:
        return 12;
      case OrderStatus.preparing:
        return 8;
      case OrderStatus.ready:
        return 0;
      case OrderStatus.served:
        return null;
    }
  }

  String _randomId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rng = Random();
    return List.generate(6, (_) => chars[rng.nextInt(chars.length)]).join();
  }
}
