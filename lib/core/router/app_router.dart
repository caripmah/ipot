import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/scanner/presentation/scanner_screen.dart';
import '../../features/menu/presentation/menu_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/order/presentation/order_status_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/scanner',
      pageBuilder: (context, state) => _buildPageWithTransition(
        child: const ScannerScreen(),
        state: state,
      ),
    ),
    GoRoute(
      path: '/menu/:tableId',
      pageBuilder: (context, state) {
        final tableId = state.pathParameters['tableId'] ?? '';
        return _buildPageWithTransition(
          child: MenuScreen(tableId: tableId),
          state: state,
        );
      },
    ),
    GoRoute(
      path: '/cart',
      pageBuilder: (context, state) => _buildPageWithTransition(
        child: const CartScreen(),
        state: state,
      ),
    ),
    GoRoute(
      path: '/order/:orderId',
      pageBuilder: (context, state) {
        final orderId = state.pathParameters['orderId'] ?? '';
        return _buildPageWithTransition(
          child: OrderStatusScreen(orderId: orderId),
          state: state,
        );
      },
    ),
  ],
);

CustomTransitionPage _buildPageWithTransition({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.98, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
