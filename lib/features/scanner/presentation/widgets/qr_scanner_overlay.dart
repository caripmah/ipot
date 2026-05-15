import 'package:flutter/material.dart';

class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;
  final double animationValue; // Added for pulse effect

  const QrScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 10,
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
    this.animationValue = 1.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height))
      ..addRect(Rect.fromCenter(
          center: rect.center, width: cutOutSize, height: cutOutSize))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final center = rect.center;

    final cutOutRect = Rect.fromCenter(
      center: center,
      width: cutOutSize,
      height: cutOutSize,
    );

    final backgroundPaint = Paint()..color = Colors.black54;
    canvas.drawPath(
      Path()
        ..addRect(rect)
        ..addRect(cutOutRect)
        ..fillType = PathFillType.evenOdd,
      backgroundPaint,
    );

    // Pulse effect calculations
    final currentBorderLength = borderLength + (animationValue * 10);
    final currentBorderColor = borderColor.withValues(alpha: 0.5 + (animationValue * 0.5));

    final borderPaint = Paint()
      ..color = currentBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path();

    // Top Left
    path.moveTo(cutOutRect.left, cutOutRect.top + currentBorderLength);
    path.lineTo(cutOutRect.left, cutOutRect.top);
    path.lineTo(cutOutRect.left + currentBorderLength, cutOutRect.top);

    // Top Right
    path.moveTo(cutOutRect.right - currentBorderLength, cutOutRect.top);
    path.lineTo(cutOutRect.right, cutOutRect.top);
    path.lineTo(cutOutRect.right, cutOutRect.top + currentBorderLength);

    // Bottom Right
    path.moveTo(cutOutRect.right, cutOutRect.bottom - currentBorderLength);
    path.lineTo(cutOutRect.right, cutOutRect.bottom);
    path.lineTo(cutOutRect.right - currentBorderLength, cutOutRect.bottom);

    // Bottom Left
    path.moveTo(cutOutRect.left + currentBorderLength, cutOutRect.bottom);
    path.lineTo(cutOutRect.left, cutOutRect.bottom);
    path.lineTo(cutOutRect.left, cutOutRect.bottom - currentBorderLength);

    canvas.drawPath(path, borderPaint);
    
    // Draw scanning line
    final scanLinePaint = Paint()
      ..color = currentBorderColor.withValues(alpha: 0.3)
      ..strokeWidth = 2;
    
    final scanLineY = cutOutRect.top + (cutOutSize * animationValue);
    canvas.drawLine(
      Offset(cutOutRect.left + 10, scanLineY),
      Offset(cutOutRect.right - 10, scanLineY),
      scanLinePaint,
    );
  }

  @override
  ShapeBorder scale(double t) => this;
}
