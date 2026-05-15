import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// ============================================
// STATES
// ============================================

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

// ============================================
// CUBIT
// ============================================

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerReady());

  /// Flag untuk mencegah emit state setelah berhasil scan
  bool _isClosed = false;

  void processQrCode(String qrCode) {
    if (_isClosed) return;

    emit(const ScannerProcessing());

    if (qrCode.startsWith('ipot://table/')) {
      final tableId = qrCode.replaceFirst('ipot://table/', '');
      if (tableId.isNotEmpty) {
        _isClosed = true;
        emit(ScannerSuccess(tableId));
      } else {
        emit(const ScannerError('Invalid table ID in QR code'));
      }
    } else {
      emit(const ScannerError('Invalid QR code format'));
    }
  }

  void reset() {
    _isClosed = false;
    emit(const ScannerReady());
  }
}
