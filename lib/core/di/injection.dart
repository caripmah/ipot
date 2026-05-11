import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/datasources/remote/api_service.dart';
import '../../data/repositories/menu_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../features/cart/bloc/cart_cubit.dart';
import '../../features/menu/bloc/menu_bloc.dart';
import '../../features/order/bloc/order_bloc.dart';
import '../../features/scanner/bloc/scanner_cubit.dart';
import 'env_config.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // ── Hive ──────────────────────────────────────────────────────────────
  await Hive.initFlutter();
  final cacheBox = await Hive.openBox('app_cache');
  getIt.registerSingleton<Box>(cacheBox);

  // ── Dio ───────────────────────────────────────────────────────────────
  final dio = Dio(BaseOptions(
    baseUrl: EnvConfig.apiBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    headers: {'Content-Type': 'application/json'},
  ));

  // Optional: add logging interceptor in debug
  assert(() {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return true;
  }());

  getIt.registerSingleton<Dio>(dio);

  // ── Services ──────────────────────────────────────────────────────────
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  // ── Repositories ──────────────────────────────────────────────────────
  getIt.registerSingleton<MenuRepository>(
    MenuRepositoryImpl(
      apiService: getIt<ApiService>(),
      cacheBox: getIt<Box>(),
    ),
  );

  getIt.registerSingleton<OrderRepository>(
    OrderRepositoryImpl(apiService: getIt<ApiService>()),
  );

  // ── BLoC/Cubits (factory — new instance per use) ──────────────────────
  getIt.registerFactory<ScannerCubit>(() => ScannerCubit());
  getIt.registerFactory<MenuBloc>(
    () => MenuBloc(menuRepository: getIt<MenuRepository>()),
  );
  getIt.registerFactory<OrderBloc>(
    () => OrderBloc(orderRepository: getIt<OrderRepository>()),
  );

  // CartCubit is a singleton — shared across screens
  getIt.registerSingleton<CartCubit>(CartCubit());
}
