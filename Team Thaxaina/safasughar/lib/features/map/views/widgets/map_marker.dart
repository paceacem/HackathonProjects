import 'package:flutter/material.dart';

class WasteDisposalMarker extends StatelessWidget {
  const WasteDisposalMarker({
    super.key,
    required this.onTap,
    this.fill = 0.0,
    this.color = Colors.green,
  });

  final void Function() onTap;
  final double fill;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _progressBuilder(),
        const SizedBox(
          height: 8.0,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 50,
              height: 70,
              child: CustomPaint(
                painter: WasteMarkerPainter(color),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.warehouse_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _progressBuilder() {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.red,
      backgroundColor: Colors.blue.withOpacity(0.2),
      value: fill,
    );
  }
}

class WasteMarkerPainter extends CustomPainter {
  final Color color;

  WasteMarkerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    // Draw the circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2.5),
      size.width / 2.5,
      paint,
    );

    // Draw the pointy end
    final Path path = Path();
    path.moveTo(size.width / 2, size.height); // Bottom center
    path.lineTo(size.width / 4, size.height / 2); // Left side
    path.lineTo(3 * size.width / 4, size.height / 2); // Right side
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
