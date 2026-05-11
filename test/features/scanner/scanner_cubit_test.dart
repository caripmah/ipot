import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_qr_ordering/features/scanner/bloc/scanner_cubit.dart';

void main() {
  late ScannerCubit sut;

  setUp(() => sut = ScannerCubit());
  tearDown(() => sut.close());

  group('ScannerCubit', () {
    test('initial state is ScannerReady', () {
      expect(sut.state, isA<ScannerReady>());
    });

    blocTest<ScannerCubit, ScannerState>(
      'processQrCode emits ScannerSuccess for valid QR',
      build: () => sut,
      act: (c) => c.processQrCode('ipot://table/T001'),
      expect: () => [
        isA<ScannerProcessing>(),
        isA<ScannerSuccess>().having((s) => s.tableId, 'tableId', 'T001'),
      ],
    );

    blocTest<ScannerCubit, ScannerState>(
      'processQrCode emits ScannerError for invalid format',
      build: () => sut,
      act: (c) => c.processQrCode('https://random-website.com'),
      expect: () => [
        isA<ScannerProcessing>(),
        isA<ScannerError>(),
      ],
    );

    blocTest<ScannerCubit, ScannerState>(
      'processQrCode emits ScannerError for empty table ID',
      build: () => sut,
      act: (c) => c.processQrCode('ipot://table/'),
      expect: () => [
        isA<ScannerProcessing>(),
        isA<ScannerError>(),
      ],
    );

    blocTest<ScannerCubit, ScannerState>(
      'reset returns to ScannerReady',
      build: () => sut,
      act: (c) {
        c.processQrCode('bad-qr');
        c.reset();
      },
      expect: () => [
        isA<ScannerProcessing>(),
        isA<ScannerError>(),
        isA<ScannerReady>(),
      ],
    );
  });
}
