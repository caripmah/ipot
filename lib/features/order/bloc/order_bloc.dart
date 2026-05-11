import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/order_models.dart';
import '../../../data/models/cart_models.dart';
import '../../../data/repositories/order_repository.dart';
import '../../../core/utils/app_logger.dart';

// ─── Events ───────────────────────────────────────────────────────────────────

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object?> get props => [];
}

class OrderSubmitRequested extends OrderEvent {
  final String tableId;
  final List<CartItem> cartItems;
  final String? customerNote;

  const OrderSubmitRequested({
    required this.tableId,
    required this.cartItems,
    this.customerNote,
  });

  @override
  List<Object?> get props => [tableId, cartItems, customerNote];
}

class OrderStatusPolled extends OrderEvent {
  final String orderId;
  const OrderStatusPolled(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class OrderPollingStarted extends OrderEvent {
  final String orderId;
  const OrderPollingStarted(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class OrderPollingCancelled extends OrderEvent {
  const OrderPollingCancelled();
}

// ─── States ───────────────────────────────────────────────────────────────────

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderSubmitting extends OrderState {
  const OrderSubmitting();
}

class OrderSubmitted extends OrderState {
  final Order order;
  const OrderSubmitted(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderTracking extends OrderState {
  final Order order;
  const OrderTracking(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}

// ─── Bloc ─────────────────────────────────────────────────────────────────────

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  Timer? _pollingTimer;

  static const _pollingInterval = Duration(seconds: 5);

  OrderBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(const OrderInitial()) {
    on<OrderSubmitRequested>(_onSubmitRequested);
    on<OrderStatusPolled>(_onStatusPolled);
    on<OrderPollingStarted>(_onPollingStarted);
    on<OrderPollingCancelled>(_onPollingCancelled);
  }

  Future<void> _onSubmitRequested(
    OrderSubmitRequested event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderSubmitting());
    try {
      final request = OrderRequest(
        tableId: event.tableId,
        customerNote: event.customerNote,
        items: event.cartItems.map((cartItem) {
          return OrderItemRequest(
            menuItemId: cartItem.menuItem.id,
            quantity: cartItem.quantity,
            customizations: cartItem.selectedOptions
                .map((opt) => OrderCustomizationRequest(
                      optionId: opt.option.id,
                      quantity: 1,
                    ))
                .toList(),
          );
        }).toList(),
      );

      final order = await _orderRepository.createOrder(request);
      emit(OrderSubmitted(order));

      // Auto-start polling after successful submission
      add(OrderPollingStarted(order.id));
    } catch (e) {
      AppLogger.error('OrderBloc submit error', e);
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onStatusPolled(
    OrderStatusPolled event,
    Emitter<OrderState> emit,
  ) async {
    try {
      final order = await _orderRepository.getOrderStatus(event.orderId);
      emit(OrderTracking(order));

      // Stop polling when order is served
      if (order.status == OrderStatus.served) {
        add(const OrderPollingCancelled());
      }
    } catch (e) {
      AppLogger.warning('Polling error (non-fatal): $e');
      // Don't emit error state for polling failures — keep showing last status
    }
  }

  void _onPollingStarted(
    OrderPollingStarted event,
    Emitter<OrderState> emit,
  ) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(_pollingInterval, (_) {
      add(OrderStatusPolled(event.orderId));
    });
  }

  void _onPollingCancelled(
    OrderPollingCancelled event,
    Emitter<OrderState> emit,
  ) {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
