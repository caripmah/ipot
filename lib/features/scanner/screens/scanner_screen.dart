import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../bloc/scanner_cubit.dart';
import '../../../core/router/app_router.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool _isNavigating = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerCubit, ScannerState>(
      listener: (context, state) {
        if (state is ScannerSuccess && !_isNavigating) {
          _isNavigating = true;
          context.go('/menu/${state.tableId}');
        }
        if (state is ScannerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Theme.of(context).colorScheme.error,
              action: SnackBarAction(
                label: 'Try Again',
                onPressed: () => context.read<ScannerCubit>().reset(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Scan Table QR',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Stack(
            children: [
              MobileScanner(
                controller: _controller,
                onDetect: (capture) {
                  if (state is ScannerReady) {
                    final barcode = capture.barcodes.firstOrNull;
                    final rawValue = barcode?.rawValue;
                    if (rawValue != null) {
                      context.read<ScannerCubit>().processQrCode(rawValue);
                    }
                  }
                },
              ),
              // Overlay
              _ScannerOverlay(),
              // Instructions
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    if (state is ScannerProcessing)
                      const CircularProgressIndicator(color: Colors.white)
                    else
                      const Icon(Icons.qr_code_scanner,
                          color: Colors.white70, size: 32),
                    const SizedBox(height: 12),
                    const Text(
                      'Point camera at the table QR code',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OverlayPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const scanArea = 260.0;
    final cx = size.width / 2;
    final cy = size.height / 2;
    final rect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: scanArea,
      height: scanArea,
    );

    final paint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    // Darken outside scan area
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        Path()..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(12))),
      ),
      paint,
    );

    // Draw corner brackets
    final cornerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    const cornerLength = 24.0;
    final corners = [
      // top-left
      [rect.topLeft, Offset(rect.left + cornerLength, rect.top),
       Offset(rect.left, rect.top + cornerLength)],
      // top-right
      [rect.topRight, Offset(rect.right - cornerLength, rect.top),
       Offset(rect.right, rect.top + cornerLength)],
      // bottom-left
      [rect.bottomLeft, Offset(rect.left + cornerLength, rect.bottom),
       Offset(rect.left, rect.bottom - cornerLength)],
      // bottom-right
      [rect.bottomRight, Offset(rect.right - cornerLength, rect.bottom),
       Offset(rect.right, rect.bottom - cornerLength)],
    ];

    for (final c in corners) {
      canvas.drawLine(c[1], c[0], cornerPaint);
      canvas.drawLine(c[0], c[2], cornerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
