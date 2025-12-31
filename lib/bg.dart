import 'package:flutter/material.dart';
import 'dart:math';

// مهم لدوال sin, cos
// افترض أن الكود السابق للمكتبة موجود في نفس الملف أو مستورد

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // أخذ أبعاد الشاشة
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: DynamicBackground(
        type: BackgroundType.style1, // نوع الخلفية
        colors: [Colors.blue, Colors.purple], // ألوان التدرج
        zoom: 1.0, // مستوى التكبير
        randomize: false, // عشوائية الحركة
        width: size.width, // إلزامي
        height: size.height, // إلزامي
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Dynamic Background!',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text('Click Me')),
            ],
          ),
        ),
      ),
    );
  }
}

enum BackgroundType { lines, particles, wave, colorShift, style1 }

class DynamicBackground extends StatefulWidget {
  final BackgroundType type;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final Widget child;
  final double width;
  final double height;

  const DynamicBackground({
    Key? key,
    required this.type,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _DynamicBackgroundState createState() => _DynamicBackgroundState();
}

class _DynamicBackgroundState extends State<DynamicBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBackground() {
    switch (widget.type) {
      case BackgroundType.lines:
        return LinesBackground(
          animation: _controller,
          colors: widget.colors,
          zoom: widget.zoom,
          randomize: widget.randomize,
          width: widget.width,
          height: widget.height,
        );
      case BackgroundType.particles:
        return ParticlesBackground(
          animation: _controller,
          colors: widget.colors,
          zoom: widget.zoom,
          randomize: widget.randomize,
          width: widget.width,
          height: widget.height,
        );
      case BackgroundType.wave:
        return WaveBackground(
          animation: _controller,
          colors: widget.colors,
          zoom: widget.zoom,
          randomize: widget.randomize,
          width: widget.width,
          height: widget.height,
        );
      case BackgroundType.colorShift:
        return ColorShiftBackground(
          animation: _controller,
          colors: widget.colors,
          zoom: widget.zoom,
          randomize: widget.randomize,
          width: widget.width,
          height: widget.height,
        );
      case BackgroundType.style1:
        return Style1(
          colors: widget.colors,
          width: widget.width,
          height: widget.height,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(children: [_buildBackground(), widget.child]),
    );
  }
}

/// ------------------- Lines -------------------
class LinesBackground extends StatelessWidget {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final double width;
  final double height;

  const LinesBackground({
    Key? key,
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LinesPainter(
        animation: animation,
        colors: colors,
        zoom: zoom,
        randomize: randomize,
      ),
      size: Size(width, height),
    );
  }
}

class _LinesPainter extends CustomPainter {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;

  _LinesPainter({
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      canvas.drawLine(
        Offset(0, i * 50 * zoom + animation.value * 50),
        Offset(size.width, i * 50 * zoom + animation.value * 50),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// ------------------- Particles -------------------
class ParticlesBackground extends StatelessWidget {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final double width;
  final double height;

  const ParticlesBackground({
    Key? key,
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ParticlesPainter(
        animation: animation,
        colors: colors,
        zoom: zoom,
        randomize: randomize,
        width: width,
        height: height,
      ),
      size: Size(width, height),
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final double width;
  final double height;

  _ParticlesPainter({
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.width,
    required this.height,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < colors.length * 10; i++) {
      paint.color = colors[i % colors.length].withOpacity(0.5);
      final dx = (i * 30.0 * zoom + animation.value * 100) % size.width;
      final dy = (i * 20.0 * zoom + animation.value * 50) % size.height;
      canvas.drawCircle(Offset(dx, dy), 5.0 * zoom, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// ------------------- Wave -------------------
class WaveBackground extends StatelessWidget {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final double width;
  final double height;

  const WaveBackground({
    Key? key,
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WavePainter(
        animation: animation,
        colors: colors,
        zoom: zoom,
        randomize: randomize,
      ),
      size: Size(width, height),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;

  _WavePainter({
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final path = Path();
    final height = size.height / 2;

    path.moveTo(0, height);
    for (double x = 0; x <= size.width; x++) {
      double y =
          height +
          30 * zoom * sin(animation.value * 2 * pi + x / size.width * 2 * pi);

      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    paint.shader = LinearGradient(
      colors: colors,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// ------------------- Color Shift -------------------
class ColorShiftBackground extends StatelessWidget {
  final Animation<double> animation;
  final List<Color> colors;
  final double zoom;
  final bool randomize;
  final double width;
  final double height;

  const ColorShiftBackground({
    Key? key,
    required this.animation,
    required this.colors,
    required this.zoom,
    required this.randomize,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors
                  .map((c) => c.withOpacity(0.5 + 0.5 * animation.value))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

//

class Style1 extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double height;

  const Style1({
    Key? key,
    required this.colors,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = (width / 350).ceil();

    return Container(
      width: width,
      height: height,
      color: colors[0],
      child: Stack(
        children: List.generate(
          (height / 30).ceil() + 10,
          (index) => Positioned(
            top: -50 + index * 30,
            child: ClipPath(
              clipper: Style1Shape(length: length),
              child: Container(height: 30 - 20, color: colors[1]),
            ),
          ),
        ),
      ),
    );
  }
}

class Style1Shape extends CustomClipper<Path> {
  final int length;

  Style1Shape({this.length = 4});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double w = size.width;
    final double h = size.height;

    final double s = h * 0.2; // ارتفاع التعرج
    final double c = w / length; // عرض كل قسم

    path.moveTo(0, h);

    for (int i = 0; i < length; i++) {
      double x1 = i * c;
      double x2 = (i + 0.5) * c;
      double x3 = (i + 1) * c;

      if (i % 2 == 0) {
        path.lineTo(x1, h);
        path.lineTo(x2, h - s);
        path.lineTo(x3, h);
      } else {
        path.lineTo(x1, h);
        path.lineTo(x2, h + s); // إذا أردت الشكل عكسي
        path.lineTo(x3, h);
      }
    }

    path.lineTo(w, h); // نهاية العرض
    path.lineTo(w, 0); // صعود إلى الأعلى
    path.lineTo(0, 0); // العودة للبداية
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant Style1Shape oldClipper) {
    return oldClipper.length != length;
  }
}
