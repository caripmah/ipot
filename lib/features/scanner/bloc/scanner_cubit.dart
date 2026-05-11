import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ─── State ────────────────────────────────────────────────────────────────────

abstract class ScannerState extends Equatable {
  const ScannerState();
  @override
  List<Object?> get props => [];
}

class ScannerReady extends ScannerState {
  const ScannerReady();
}

class ScannerProcessing extends ScannerState {
  const ScannerProcessing();
}

class ScannerSuccess extends ScannerState {
  final String tableId;
  const ScannerSuccess(this.tableId);

  @override
  List<Object?> get props => [tableId];
}

class ScannerError extends ScannerState {
  final String message;
  const ScannerError(this.message);

  @override
  List<Object?> get props => [message];
}

// ─── Cubit ────────────────────────────────────────────────────────────────────

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerReady());

  static final _qrPattern = RegExp(r'^ipot://table/(.+)$');

  void processQrCode(String rawValue) {
    emit(const ScannerProcessing());

    final match = _qrPattern.firstMatch(rawValue);
    if (match == null) {
      emit(const ScannerError(
        'Invalid QR code. Please scan a valid table QR code.',
      ));
      return;
    }

    final tableId = match.group(1)?.trim() ?? '';
    if (tableId.isEmpty) {
      emit(const ScannerError('QR code contains an empty table ID.'));
      return;
    }

    emit(ScannerSuccess(tableId));
  }

  void reset() => emit(const ScannerReady());
}
