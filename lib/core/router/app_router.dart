import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/scanner/screens/scanner_screen.dart';
import '../../features/menu/screens/menu_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/order/screens/order_confirmation_screen.dart';
import '../../features/order/screens/order_tracking_screen.dart';
import '../di/injection.dart';
import '../../features/menu/bloc/menu_bloc.dart';
import '../../features/order/bloc/order_bloc.dart';
import '../../features/scanner/bloc/scanner_cubit.dart';
import '../../features/cart/bloc/cart_cubit.dart';

abstract class AppRoutes {
  static const scanner = '/';
  static const menu = '/menu/:tableId';
  static const cart = '/cart';
  static const orderConfirmation = '/order/confirmation';
  static const orderTracking = '/order/:orderId/tracking';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.scanner,
  routes: [
    GoRoute(
      path: AppRoutes.scanner,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<ScannerCubit>(),
        child: const ScannerScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.menu,
      builder: (context, state) {
        final tableId = state.pathParameters['tableId']!;
        return BlocProvider(
          create: (_) => getIt<MenuBloc>()
            ..add(MenuFetchRequested(tableId)),
          child: MenuScreen(tableId: tableId),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.cart,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderConfirmation,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (_) => getIt<OrderBloc>(),
          child: OrderConfirmationScreen(
            tableId: extra['tableId'] as String,
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.orderTracking,
      builder: (context, state) {
        final orderId = state.pathParameters['orderId']!;
        return BlocProvider(
          create: (_) => getIt<OrderBloc>()
            ..add(OrderPollingStarted(orderId)),
          child: OrderTrackingScreen(orderId: orderId),
        );
      },
    ),
  ],
);
