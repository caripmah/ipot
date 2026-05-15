import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;
import '../../../core/di/injection.dart';
import '../bloc/menu_bloc.dart';
import 'menu_view.dart';

class MenuScreen extends StatelessWidget {
  final String tableId;

  const MenuScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context) {
    developer.log('🏗️ MenuScreen build: tableId=$tableId', name: 'MenuScreen');
    return BlocProvider(
      create: (context) {
        developer.log('🔧 Creating MenuBloc', name: 'MenuScreen');
        final bloc = getIt<MenuBloc>();
        bloc.add(MenuFetchRequested(tableId));
        return bloc;
      },
      child: MenuView(tableId: tableId),
    );
  }
}
