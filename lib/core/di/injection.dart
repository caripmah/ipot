import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/datasources/remote/api_service.dart';
import '../../data/datasources/remote/mock_api_service.dart';
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

  // ── ApiService — Mock or Real based on USE_MOCK flag ──────────────────
  final ApiService apiService;

  if (EnvConfig.useMock) {
    apiService = MockApiService();
  } else {
    final dio = Dio(BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));
    assert(() {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      return true;
    }());
    apiService = RealApiService(dio);
  }

  getIt.registerSingleton<ApiService>(apiService);

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

  // ── BLoC/Cubits ───────────────────────────────────────────────────────
  getIt.registerFactory<ScannerCubit>(() => ScannerCubit());
  getIt.registerFactory<MenuBloc>(
      () => MenuBloc(menuRepository: getIt<MenuRepository>()));
  getIt.registerFactory<OrderBloc>(
      () => OrderBloc(orderRepository: getIt<OrderRepository>()));
  getIt.registerSingleton<CartCubit>(CartCubit());
}
