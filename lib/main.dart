import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'features/cart/bloc/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const IpotApp());
}

class IpotApp extends StatelessWidget {
  const IpotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // CartCubit is provided globally — accessible from any screen
        BlocProvider<CartCubit>.value(value: getIt<CartCubit>()),
      ],
      child: MaterialApp.router(
        title: 'IPOT Ordering',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF1565C0),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
