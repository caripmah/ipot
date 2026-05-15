import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../bloc/scanner_cubit.dart';
import 'widgets/qr_scanner_overlay.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  MobileScannerController? _controller;
  late AnimationController _animationController;
  bool _isNavigating = false;
  bool _isControllerReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _initController();
  }

  void _initController() {
    _controller?.dispose();
    _controller = MobileScannerController();
    _isControllerReady = true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_isControllerReady || _controller == null) return;

    switch (state) {
      case AppLifecycleState.paused:
        _controller!.stop();
        _animationController.stop();
        break;
      case AppLifecycleState.resumed:
        if (!_isNavigating) {
          _controller!.start();
          _animationController.repeat(reverse: true);
        }
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    _isNavigating = true;
    _isControllerReady = false;

    final controller = _controller;
    _controller = null;

    // Stop async, jangan await di dispose
    controller?.stop().then((_) {
      controller.dispose();
    }).catchError((_) {
      controller.dispose();
    });

    super.dispose();
  }

  Future<void> _stopCamera() async {
    if (!_isControllerReady || _controller == null) return;
    try {
      await _controller!.stop();
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _navigateToMenu(String tableId) async {
    if (_isNavigating) return;
    _isNavigating = true;

    await _stopCamera();

    // Delay untuk memastikan native resources released
    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      context.pushReplacement('/menu/$tableId');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isControllerReady || _controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    const kAccent = Color(0xFF4A6CF7);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Scan Table QR',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: ValueListenableBuilder<MobileScannerState>(
              valueListenable: _controller!,
              builder: (context, state, child) {
                switch (state.torchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.white70);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                  case TorchState.unavailable:
                    return const Icon(Icons.flash_off, color: Colors.red);
                  case TorchState.auto:
                    return const Icon(Icons.flash_auto, color: Colors.blue);
                }
              },
            ),
            onPressed: () => _controller?.toggleTorch(),
          ),
          IconButton(
            icon: ValueListenableBuilder<MobileScannerState>(
              valueListenable: _controller!,
              builder: (context, state, child) {
                switch (state.cameraDirection) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front, color: Colors.white70);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear, color: Colors.white70);
                }
              },
            ),
            onPressed: () => _controller?.switchCamera(),
          ),
        ],
      ),
      body: BlocConsumer<ScannerCubit, ScannerState>(
        listener: (context, state) {
          if (state is ScannerSuccess) {
            _navigateToMenu(state.tableId);
          } else if (state is ScannerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'Retry',
                  textColor: Colors.white,
                  onPressed: () {
                    _isNavigating = false;
                    _controller?.start();
                    context.read<ScannerCubit>().reset();
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ScannerProcessing) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              MobileScanner(
                controller: _controller!,
                onDetect: (capture) {
                  if (_isNavigating) return;

                  final List<Barcode> barcodes = capture.barcodes;
                  if (barcodes.isEmpty) return;

                  for (final barcode in barcodes) {
                    final String? code = barcode.rawValue;
                    if (code != null && code.isNotEmpty) {
                      _isNavigating = true;
                      _stopCamera();
                      context.read<ScannerCubit>().processQrCode(code);
                      break;
                    }
                  }
                },
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: ShapeDecoration(
                      shape: QrScannerOverlayShape(
                        borderColor: kAccent,
                        borderRadius: 20,
                        borderLength: 35,
                        borderWidth: 8,
                        cutOutSize: 260,
                        animationValue: _animationController.value,
                      ),
                    ),
                  );
                },
              ),
              _buildUIOverlay(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUIOverlay(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 320),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Align QR code within the frame',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 60),
          // ✅ Tombol bypass untuk testing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton.icon(
              onPressed: () => context.go('/menu/T001'),
              icon: const Icon(Icons.bolt_rounded, color: Colors.yellow),
              label: const Text('QUICK DEMO ENTRY'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 56),
                textStyle: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
