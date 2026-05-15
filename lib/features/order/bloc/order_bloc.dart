import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/order_models.dart';
import '../../../data/repositories/order_repository.dart';

// ─── Events ──────────────────────────────────────────────────────────────────

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class OrderCreated extends OrderEvent {
  final OrderRequest request;
  const OrderCreated(this.request);

  @override
  List<Object?> get props => [request];
}

class OrderStatusChecked extends OrderEvent {
  final String orderId;
  const OrderStatusChecked(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

// ─── States ──────────────────────────────────────────────────────────────────

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final Order order;
  const OrderSuccess(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}

// ─── BLoC ────────────────────────────────────────────────────────────────────

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<OrderCreated>(_onCreated);
    on<OrderStatusChecked>(_onStatusChecked);
  }

  Future<void> _onCreated(
    OrderCreated event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final order = await orderRepository.createOrder(event.request);
      emit(OrderSuccess(order));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onStatusChecked(
    OrderStatusChecked event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final order = await orderRepository.getOrderStatus(event.orderId);
      emit(OrderSuccess(order));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
