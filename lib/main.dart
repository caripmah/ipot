import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'features/cart/bloc/cart_cubit.dart';
import 'features/order/bloc/order_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Tangkap semua error Flutter
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    developer.log('❌ FLUTTER ERROR: ${details.exception}',
        name: 'App', error: details.exception, stackTrace: details.stack);
  };

  await setupDependencies();
  runApp(const IpotApp());
}

class IpotApp extends StatelessWidget {
  const IpotApp({super.key});

  @override
  Widget build(BuildContext context) {
    const kPrimary = Color(0xFF0A1128);
    const kAccent = Color(0xFF4A6CF7);
    const kBg = Color(0xFFF8FAFF);

    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>.value(value: getIt<CartCubit>()),
        BlocProvider<OrderBloc>(create: (context) => getIt<OrderBloc>()),
      ],
      child: MaterialApp.router(
        title: 'IPOT Ordering',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kAccent,
            primary: kPrimary,
            secondary: kAccent,
            surface: Colors.white,
          ),
          scaffoldBackgroundColor: kBg,
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
            Theme.of(context).textTheme,
          ).copyWith(
            displayLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
            displayMedium: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
            headlineLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
            headlineMedium: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
            titleLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: GoogleFonts.plusJakartaSans(
              color: kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            iconTheme: const IconThemeData(color: kPrimary),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccent,
              foregroundColor: Colors.white,
              elevation: 0,
              textStyle: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
