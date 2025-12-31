import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:packages_tester_web/bg.dart';
import 'package:polygon/polygon.dart';

void main() {
  runApp(const MyApp());
}

/// ===============================
/// APP
/// ===============================
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

const String img =
    'https://images.pexels.com/photos/32838840/pexels-photo-32838840.jpeg';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final types = ImageCutType.values;

    return Scaffold(
      appBar: AppBar(title: const Text('Image Cut Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: types.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return CutImage(image: const NetworkImage(img), type: types[index]);
          },
        ),
      ),
    );
  }
}

/// ===============================
/// ENUM
/// ===============================
enum ImageCutType {
  circle,
  ring,
  roundedRect,
  rotatedSquare,

  teardrop,
  fourPetalFlower,

  rightTriangleBottomRight,
  rightTriangleBottomLeft,
  rightTriangleTopRight,
  rightTriangleTopLeft,

  roundedSlantedRectangle1,
  roundedSlantedRectangle2,

  // eaightPetalFlower,
  circles4,
  circles9,
  circles16,
  circles25,
  circles36,
  circles49,

  /*
  number0,
  number1,
  number2,
  number3,
  number4,
  number5,
  number6,
  number7,
  number8,
  number9,
  */
  triangleEquilateral,
  pentagon,
  hexagon,
  heptagon,
  octagon,
  nonagon,
  decagon,
  hendecagon,
  dodecagon,
  tridecagon,
  tetradecagon,
  pentadecagon,
  hexadecagon,

  
  threeRoundedPill1,
  threeRoundedPill2,

  masonry4TopLeft,
  masonry4TopRight,
  masonry3HorizontalTop,
  masonry3HorizontalBottom,
  masonry3VerticalLeft,
  masonry3VerticalRight,

  verticalSplit2,
  verticalSplit3,
  verticalSplit4,
  verticalSplit5,
  horizontalSplit2,
  horizontalSplit3,
  horizontalSplit4,
  horizontalSplit5,

  verticalZigzag2,
  verticalZigzag3,
  verticalZigzag4,
  verticalZigzag5,
  horizontalZigzag2,
  horizontalZigzag3,
  horizontalZigzag4,
  horizontalZigzag5,

}

/// ===============================
/// CUT IMAGE
/// ===============================
class CutImage extends StatelessWidget {
  final ImageProvider image;
  final ImageCutType type;
  final double borderRadius;
  final double strokeWidth;
  final double strokeHeight;
  final double splitCornerRadius;
  final double polygonCornerRadius;
  final double ringThickness;

  const CutImage({
    super.key,
    required this.image,
    required this.type,
    this.borderRadius = 16,
    this.strokeWidth = 4.0,
    this.strokeHeight = 4.0,
    this.splitCornerRadius = 8.0,
    this.polygonCornerRadius = 12.0,
    this.ringThickness = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    final imgWidget = AspectRatio(
      aspectRatio: 1,
      child: Image(image: image, fit: BoxFit.fill),
    );

    return switch (type) {
      ImageCutType.circle => ClipOval(child: imgWidget),

      ImageCutType.roundedRect => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imgWidget,
      ),
      ImageCutType.teardrop => ClipPath(
        clipper: Teardrop(cornerRadius: 20),
        child: imgWidget,
      ),
      ImageCutType.circles4 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 2, gap: 4),
        child: imgWidget,
      ),
      ImageCutType.circles9 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 3, gap: 4),
        child: imgWidget,
      ),
      ImageCutType.circles16 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 4, gap: 4),
        child: imgWidget,
      ),
      ImageCutType.circles25 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 5, gap: 4),
        child: imgWidget,
      ),
      ImageCutType.circles36 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 6, gap: 4),
        child: imgWidget,
      ),
      ImageCutType.circles49 => ClipPath(
        clipper: CircleGridClipper(circlesPerLine: 7, gap: 4),
        child: imgWidget,
      ),

      ImageCutType.roundedSlantedRectangle1 => ClipPath(
        clipper: RoundedSlantedRectangle(cornerRadius: 20),
        child: imgWidget,
      ),
      ImageCutType.roundedSlantedRectangle2 => ClipPath(
        clipper: RoundedSlantedRectangle(
          cornerRadius: 20,
          direction: SlantedRectangleDirection.mirrored,
        ),
        child: imgWidget,
      ),
      ImageCutType.rotatedSquare => ClipPath(
        clipper: RotatedSquareClipper(cornerRadius: 20),
        child: imgWidget,
      ),

      ImageCutType.ring => ClipPath(
        clipper: RingClipper(thickness: ringThickness),
        child: imgWidget,
      ),

      /*

      ImageCutType.number0 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 0),
        child: imgWidget,
      ),

      ImageCutType.number1 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 1),
        child: imgWidget,
      ),

      ImageCutType.number2 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 2),
        child: imgWidget,
      ),

      ImageCutType.number3 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 3),
        child: imgWidget,
      ),

      ImageCutType.number4 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 4),
        child: imgWidget,
      ),

      ImageCutType.number5 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 5),
        child: imgWidget,
      ),

      ImageCutType.number6 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 6),
        child: imgWidget,
      ),

      ImageCutType.number7 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 7),
        child: imgWidget,
      ),

      ImageCutType.number8 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 8),
        child: imgWidget,
      ),

      ImageCutType.number9 => ClipPath(
        clipper: NumbersClipper(cornerRadius: borderRadius, number: 9),
        child: imgWidget,
      ),*/
      ImageCutType.masonry4TopLeft => ClipPath(
        clipper: Masonry4Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: MasonryDirection.topLeft,
        ),
        child: imgWidget,
      ),

      ImageCutType.masonry4TopRight => ClipPath(
        clipper: Masonry4Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: MasonryDirection.topRight,
        ),
        child: imgWidget,
      ),

      ImageCutType.masonry3HorizontalTop => ClipPath(
        clipper: Masonry3Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: Masonry3Direction.horizontalTop,
        ),
        child: imgWidget,
      ),

      ImageCutType.masonry3HorizontalBottom => ClipPath(
        clipper: Masonry3Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: Masonry3Direction.horizontalBottom,
        ),
        child: imgWidget,
      ),

      ImageCutType.masonry3VerticalLeft => ClipPath(
        clipper: Masonry3Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: Masonry3Direction.verticalLeft,
        ),
        child: imgWidget,
      ),

      ImageCutType.masonry3VerticalRight => ClipPath(
        clipper: Masonry3Clipper(
          stroke: strokeWidth,
          cornerRadius: splitCornerRadius,
          direction: Masonry3Direction.verticalRight,
        ),
        child: imgWidget,
      ),

      ImageCutType.fourPetalFlower => ClipPath(
        clipper: FourPetalFlower(radius: 20),

        child: imgWidget,
      ),

      ImageCutType.rightTriangleBottomRight => ClipPath(
        clipper: RightTriangleClipper(
          cornerRadius: 20,
          direction: RightTriangleDirection.bottomRight,
        ),
        child: imgWidget,
      ),
      ImageCutType.rightTriangleBottomLeft => ClipPath(
        clipper: RightTriangleClipper(
          cornerRadius: 20,
          direction: RightTriangleDirection.bottomLeft,
        ),
        child: imgWidget,
      ),
      ImageCutType.rightTriangleTopRight => ClipPath(
        clipper: RightTriangleClipper(
          cornerRadius: 20,
          direction: RightTriangleDirection.topRight,
        ),
        child: imgWidget,
      ),
      ImageCutType.rightTriangleTopLeft => ClipPath(
        clipper: RightTriangleClipper(
          cornerRadius: 20,
          direction: RightTriangleDirection.topLeft,
        ),
        child: imgWidget,
      ),
      ImageCutType.triangleEquilateral => ClipPath(
        clipper: PolygonClipper(sides: 3, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.pentagon => ClipPath(
        clipper: PolygonClipper(sides: 5, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.hexagon => ClipPath(
        clipper: PolygonClipper(sides: 6, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.heptagon => ClipPath(
        clipper: PolygonClipper(sides: 7, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.octagon => ClipPath(
        clipper: PolygonClipper(sides: 8, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.nonagon => ClipPath(
        clipper: PolygonClipper(sides: 9, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),
      ImageCutType.decagon => ClipPath(
        clipper: PolygonClipper(sides: 10, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.hendecagon => ClipPath(
        clipper: PolygonClipper(sides: 11, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.dodecagon => ClipPath(
        clipper: PolygonClipper(sides: 12, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.tridecagon => ClipPath(
        clipper: PolygonClipper(sides: 13, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.tetradecagon => ClipPath(
        clipper: PolygonClipper(sides: 14, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.pentadecagon => ClipPath(
        clipper: PolygonClipper(sides: 15, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.hexadecagon => ClipPath(
        clipper: PolygonClipper(sides: 16, cornerRadius: polygonCornerRadius),
        child: imgWidget,
      ),

      ImageCutType.verticalSplit2 => ClipPath(
        clipper: SplitClipper(
          slides: 2,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalSplit3 => ClipPath(
        clipper: SplitClipper(
          slides: 3,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalSplit4 => ClipPath(
        clipper: SplitClipper(
          slides: 4,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalSplit5 => ClipPath(
        clipper: SplitClipper(
          slides: 5,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalSplit2 => ClipPath(
        clipper: SplitClipper(
          slides: 2,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalSplit3 => ClipPath(
        clipper: SplitClipper(
          slides: 3,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalSplit4 => ClipPath(
        clipper: SplitClipper(
          slides: 4,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalSplit5 => ClipPath(
        clipper: SplitClipper(
          slides: 5,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalZigzag2 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 2,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          strokeHeight: 30,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalZigzag3 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 3,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalZigzag4 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 4,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.verticalZigzag5 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 5,
          direction: Axis.vertical,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalZigzag2 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 2,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalZigzag3 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 3,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalZigzag4 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 4,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),

      ImageCutType.horizontalZigzag5 => ClipPath(
        clipper: ZigzagSplitClipper(
          slides: 5,
          direction: Axis.horizontal,
          strokeWidth: strokeWidth,
          strokeHeight: strokeHeight,
          cornerRadius: splitCornerRadius,
        ),
        child: imgWidget,
      ),
      ImageCutType.threeRoundedPill1 => ClipPath(
        clipper: ThreeRoundedPill(
          direction: ThreeRoundedPillDirection.horizontal,
        ),
        child: imgWidget,
      ),
      ImageCutType.threeRoundedPill2 => ClipPath(
        clipper: ThreeRoundedPill(
          direction: ThreeRoundedPillDirection.vertical,
        ),
        child: imgWidget,
      ),
    };
  }
}

/// ===============================
/// RING CLIPPER
/// ===============================
class RingClipper extends CustomClipper<Path> {
  final double thickness;

  RingClipper({this.thickness = 0.3})
    : assert(
        thickness > 0 && thickness < 1,
        'Thickness must be between 0 and 1',
      );

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width < size.height
        ? size.width / 2
        : size.height / 2;
    final innerRadius = outerRadius * (1 - thickness);

    final path = Path()
      // Outer circle
      ..addOval(Rect.fromCircle(center: center, radius: outerRadius))
      // Inner circle (cutout)
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius));

    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(RingClipper oldClipper) {
    return oldClipper.thickness != thickness;
  }
}

/// ===============================
/// MASONRY 3 DIRECTION ENUM
/// ===============================
enum Masonry3Direction {
  horizontalTop, // Top wide, bottom two narrow (horizontal layout)
  horizontalBottom, // Top two narrow, bottom wide (horizontal layout)
  verticalLeft, // Left wide, right two narrow (vertical layout)
  verticalRight, // Left two narrow, right wide (vertical layout)
}

/// ===============================
/// MASONRY 3 CLIPPER
/// ===============================
class Masonry3Clipper extends CustomClipper<Path> {
  final double stroke;
  final double cornerRadius;
  final Masonry3Direction direction;

  Masonry3Clipper({
    this.stroke = 4.0,
    this.cornerRadius = 8.0,
    this.direction = Masonry3Direction.horizontalTop,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    switch (direction) {
      case Masonry3Direction.horizontalTop:
        _addHorizontalTopPattern(path, size);
        break;
      case Masonry3Direction.horizontalBottom:
        _addHorizontalBottomPattern(path, size);
        break;
      case Masonry3Direction.verticalLeft:
        _addVerticalLeftPattern(path, size);
        break;
      case Masonry3Direction.verticalRight:
        _addVerticalRightPattern(path, size);
        break;
    }

    return path;
  }

  void _addHorizontalTopPattern(Path path, Size size) {
    // Top wide rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, (size.height - stroke) * 2 / 3),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom left narrow rectangle (1/3 height, half width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom right narrow rectangle (1/3 height, half width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addHorizontalBottomPattern(Path path, Size size) {
    // Top left narrow rectangle (1/3 height, half width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Top right narrow rectangle (1/3 height, half width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom wide rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) / 3 + stroke,
          size.width,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addVerticalLeftPattern(Path path, Size size) {
    // Left wide rectangle (2/3 width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, (size.width - stroke) * 2 / 3, size.height),
        Radius.circular(cornerRadius),
      ),
    );

    // Right top narrow rectangle (1/3 width, half height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) * 2 / 3 + stroke,
          0,
          (size.width - stroke) / 3,
          (size.height - stroke) / 2,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Right bottom narrow rectangle (1/3 width, half height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) * 2 / 3 + stroke,
          (size.height - stroke) / 2 + stroke,
          (size.width - stroke) / 3,
          (size.height - stroke) / 2,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addVerticalRightPattern(Path path, Size size) {
    // Left top narrow rectangle (1/3 width, half height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 3,
          (size.height - stroke) / 2,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Left bottom narrow rectangle (1/3 width, half height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) / 2 + stroke,
          (size.width - stroke) / 3,
          (size.height - stroke) / 2,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Right wide rectangle (2/3 width)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 3 + stroke,
          0,
          (size.width - stroke) * 2 / 3,
          size.height,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  @override
  bool shouldReclip(Masonry3Clipper oldClipper) {
    return oldClipper.stroke != stroke ||
        oldClipper.cornerRadius != cornerRadius ||
        oldClipper.direction != direction;
  }
}

/// ===============================
/// MASONRY DIRECTION ENUM
/// ===============================
enum MasonryDirection {
  topLeft, // Tall on left, short on right (top)
  topRight, // Short on left (top), tall on right
  bottomLeft, // Short on left (bottom), tall on right
  bottomRight, // Tall on left, short on right (bottom)
}

/// ===============================
/// MASONRY 4 CLIPPER
/// ===============================
class Masonry4Clipper extends CustomClipper<Path> {
  final double stroke;
  final double cornerRadius;
  final MasonryDirection direction;

  Masonry4Clipper({
    this.stroke = 4.0,
    this.cornerRadius = 8.0,
    this.direction = MasonryDirection.topLeft,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    switch (direction) {
      case MasonryDirection.topLeft:
        // Top left tall, bottom left short, top right short, bottom right tall
        _addTopLeftPattern(path, size);
        break;
      case MasonryDirection.topRight:
        // Top left short, bottom left tall, top right tall, bottom right short
        _addTopRightPattern(path, size);
        break;
      case MasonryDirection.bottomLeft:
        // Top left short, bottom left tall, top right tall, bottom right short
        _addBottomLeftPattern(path, size);
        break;
      case MasonryDirection.bottomRight:
        // Top left tall, bottom left short, top right short, bottom right tall
        _addBottomRightPattern(path, size);
        break;
    }

    return path;
  }

  void _addTopLeftPattern(Path path, Size size) {
    // Top left tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom left short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Top right short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom right tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          (size.height - stroke) / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addTopRightPattern(Path path, Size size) {
    // Top left short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom left tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Top right tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom right short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addBottomLeftPattern(Path path, Size size) {
    // Top left tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom left short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Top right short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom right tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          (size.height - stroke) / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  void _addBottomRightPattern(Path path, Size size) {
    // Top left short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom left tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          (size.height - stroke) / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Top right tall rectangle (2/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          0,
          (size.width - stroke) / 2,
          (size.height - stroke) * 2 / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );

    // Bottom right short rectangle (1/3 height)
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          (size.width - stroke) / 2 + stroke,
          (size.height - stroke) * 2 / 3 + stroke,
          (size.width - stroke) / 2,
          (size.height - stroke) / 3,
        ),
        Radius.circular(cornerRadius),
      ),
    );
  }

  @override
  bool shouldReclip(Masonry4Clipper oldClipper) {
    return oldClipper.stroke != stroke ||
        oldClipper.cornerRadius != cornerRadius ||
        oldClipper.direction != direction;
  }
}

/// ===============================
/// DIAGONAL CLIPPER
/// ===============================

/// ===============================
/// POLYGON CLIPPER
/// ===============================
class PolygonClipper extends CustomClipper<Path> {
  final int sides;
  final double rotation;
  final double cornerRadius;

  PolygonClipper({
    required this.sides,
    this.rotation = 0,
    this.cornerRadius = 0,
  }) : assert(sides >= 3, 'Polygon must have at least 3 sides');

  @override
  Path getClip(Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2 + (sides == 3 ? 20 : 0),
    );
    final radius = size.width < size.height ? size.width / 2 : size.height / 2;

    // Calculate angle between vertices
    final angle = (2 * 3.141592653589793) / sides;

    // Start angle (rotation + offset to make shapes upright)
    final startAngle = rotation - (3.141592653589793 / 2);

    // Generate all vertices
    final vertices = <Offset>[];
    for (int i = 0; i < sides; i++) {
      final currentAngle = startAngle + (angle * i);
      vertices.add(
        Offset(
          center.dx + radius * math.cos(currentAngle),
          center.dy + radius * math.sin(currentAngle),
        ),
      );
    }

    // If no corner radius, draw simple polygon
    if (cornerRadius <= 0) {
      final path = Path()..moveTo(vertices[0].dx, vertices[0].dy);
      for (int i = 1; i < vertices.length; i++) {
        path.lineTo(vertices[i].dx, vertices[i].dy);
      }
      path.close();
      return path;
    }

    // Draw polygon with rounded corners
    final path = Path();

    for (int i = 0; i < vertices.length; i++) {
      final current = vertices[i];
      final next = vertices[(i + 1) % vertices.length];
      final prev = vertices[(i - 1 + vertices.length) % vertices.length];

      // Calculate direction vectors
      final toPrev = Offset(prev.dx - current.dx, prev.dy - current.dy);
      final toNext = Offset(next.dx - current.dx, next.dy - current.dy);

      // Normalize vectors
      final toPrevLen = math.sqrt(
        toPrev.dx * toPrev.dx + toPrev.dy * toPrev.dy,
      );
      final toNextLen = math.sqrt(
        toNext.dx * toNext.dx + toNext.dy * toNext.dy,
      );

      final toPrevNorm = Offset(toPrev.dx / toPrevLen, toPrev.dy / toPrevLen);
      final toNextNorm = Offset(toNext.dx / toNextLen, toNext.dy / toNextLen);

      // Calculate corner points
      final cornerRadiusClamped = cornerRadius
          .clamp(0.0, toPrevLen / 2)
          .clamp(0.0, toNextLen / 2);

      final p1 = Offset(
        current.dx + toPrevNorm.dx * cornerRadiusClamped,
        current.dy + toPrevNorm.dy * cornerRadiusClamped,
      );

      final p2 = Offset(
        current.dx + toNextNorm.dx * cornerRadiusClamped,
        current.dy + toNextNorm.dy * cornerRadiusClamped,
      );

      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }

      // Draw rounded corner using quadratic bezier
      path.quadraticBezierTo(current.dx, current.dy, p2.dx, p2.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(PolygonClipper oldClipper) {
    return oldClipper.sides != sides ||
        oldClipper.rotation != rotation ||
        oldClipper.cornerRadius != cornerRadius;
  }
}

/// ===============================
/// SPLIT CLIPPER
/// ===============================
class SplitClipper extends CustomClipper<Path> {
  final int slides;
  final Axis direction;
  final double strokeWidth;
  final double cornerRadius;

  SplitClipper({
    required this.slides,
    required this.direction,
    this.strokeWidth = 4.0,
    this.cornerRadius = 8.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final isVertical = direction == Axis.vertical;

    // Calculate total stroke space
    final totalStroke = strokeWidth * (slides - 1);

    // Calculate slide size
    final slideSize = isVertical
        ? (size.width - totalStroke) / slides
        : (size.height - totalStroke) / slides;

    // Create each slide with rounded corners
    for (int i = 0; i < slides; i++) {
      final offset = i * (slideSize + strokeWidth);

      if (isVertical) {
        // Vertical splits (left to right)
        path.addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(offset, 0, slideSize, size.height),
            Radius.circular(cornerRadius),
          ),
        );
      } else {
        // Horizontal splits (top to bottom)
        path.addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, offset, size.width, slideSize),
            Radius.circular(cornerRadius),
          ),
        );
      }
    }

    return path;
  }

  @override
  bool shouldReclip(SplitClipper oldClipper) {
    return oldClipper.slides != slides ||
        oldClipper.direction != direction ||
        oldClipper.strokeWidth != strokeWidth ||
        oldClipper.cornerRadius != cornerRadius;
  }
}

/// ===============================
/// ZIGZAG SPLIT CLIPPER
/// ===============================
class ZigzagSplitClipper extends CustomClipper<Path> {
  final int slides;
  final Axis direction;
  final double strokeWidth;
  final double strokeHeight;
  final double cornerRadius;

  ZigzagSplitClipper({
    required this.slides,
    required this.direction,
    this.strokeWidth = 4.0,
    this.strokeHeight = 4.0,
    this.cornerRadius = 8.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final isVertical = direction == Axis.vertical;

    // Calculate total stroke space
    final totalStroke = strokeWidth * (slides - 1);

    // Calculate slide size
    final slideSize = isVertical
        ? (size.width - totalStroke) / slides
        : (size.height - totalStroke) / slides;

    // Create each slide with zigzag pattern (alternating offsets)
    for (int i = 0; i < slides; i++) {
      final baseOffset = i * (slideSize + strokeWidth);
      final isEven = i % 2 == 0;

      if (isVertical) {
        // Vertical splits (left to right) with alternating top/bottom offsets
        final topOffset = isEven ? 0.0 : strokeHeight;
        final height = size.height - strokeHeight;

        path.addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(baseOffset, topOffset, slideSize, height),
            Radius.circular(cornerRadius),
          ),
        );
      } else {
        // Horizontal splits (top to bottom) with alternating left/right offsets
        final leftOffset = isEven ? 0.0 : strokeHeight;
        final width = size.width - strokeHeight;

        path.addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(leftOffset, baseOffset, width, slideSize),
            Radius.circular(cornerRadius),
          ),
        );
      }
    }

    return path;
  }

  @override
  bool shouldReclip(ZigzagSplitClipper oldClipper) {
    return oldClipper.slides != slides ||
        oldClipper.direction != direction ||
        oldClipper.strokeWidth != strokeWidth ||
        oldClipper.strokeHeight != strokeHeight ||
        oldClipper.cornerRadius != cornerRadius;
  }
}

enum RightTriangleDirection { bottomRight, bottomLeft, topRight, topLeft }

class RightTriangleClipper extends CustomClipper<Path> {
  final double cornerRadius;
  final RightTriangleDirection direction;

  RightTriangleClipper({
    this.cornerRadius = 20.0,
    this.direction = RightTriangleDirection.bottomRight,
  });

  @override
  Path getClip(Size size) {
    // Normalized triangle points from -1 to 1
    List<Offset> points = [
      const Offset(-1, -1), // top-left
      const Offset(1, -1), // top-right
      const Offset(-1, 1), // bottom-left
    ];

    // Rotate points based on direction
    switch (direction) {
      case RightTriangleDirection.bottomRight:
        break; // already correct
      case RightTriangleDirection.bottomLeft:
        points = points.map((p) => Offset(-p.dx, p.dy)).toList();
        break;
      case RightTriangleDirection.topRight:
        points = points.map((p) => Offset(p.dx, -p.dy)).toList();
        break;
      case RightTriangleDirection.topLeft:
        points = points.map((p) => Offset(-p.dx, -p.dy)).toList();
        break;
    }

    final polygon = Polygon(points);

    // Compute the path scaled to the widget size
    return polygon.computePath(rect: Offset.zero & size, radius: cornerRadius);
  }

  @override
  bool shouldReclip(covariant RightTriangleClipper oldClipper) {
    return oldClipper.cornerRadius != cornerRadius ||
        oldClipper.direction != direction;
  }
}

//

class Teardrop extends CustomClipper<Path> {
  final double cornerRadius;

  Teardrop({this.cornerRadius = 20.0});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Center of the square
    final center = Offset(size.width / 2, size.height / 2);

    // Half-diagonal
    final double halfDiag = size.width / 2;

    // Define square points (rotated 45 degrees)
    final points = [
      Offset(center.dx, center.dy - halfDiag), // top
      Offset(center.dx + halfDiag, center.dy), // right
      Offset(center.dx, center.dy + halfDiag), // bottom
      Offset(center.dx - halfDiag, center.dy), // left
    ];

    // Move to first point
    path.moveTo(points[0].dx, points[0].dy);

    // Draw lines with corner radius
    for (int i = 0; i < points.length; i++) {
      final next = points[(i + 1) % points.length];

      // Line to next point minus radius
      final mid = Offset(
        (points[i].dx + next.dx) / 2,
        (points[i].dy + next.dy) / 2,
      );

      path.quadraticBezierTo(points[i].dx, points[i].dy, mid.dx, mid.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant Teardrop oldClipper) {
    return oldClipper.cornerRadius != cornerRadius;
  }
}

class RotatedSquareClipper extends CustomClipper<Path> {
  final double cornerRadius;

  RotatedSquareClipper({this.cornerRadius = 20.0});

  @override
  Path getClip(Size size) {
    // Normalized coordinates for a diamond (-1..1)
    List<Offset> points = [
      const Offset(0, -1), // top
      const Offset(1, 0), // right
      const Offset(0, 1), // bottom
      const Offset(-1, 0), // left
    ];

    final polygon = Polygon(points);

    // Compute the path scaled to the widget size
    return polygon.computePath(rect: Offset.zero & size, radius: cornerRadius);
  }

  @override
  bool shouldReclip(covariant RotatedSquareClipper oldClipper) {
    return oldClipper.cornerRadius != cornerRadius;
  }
}

enum SlantedRectangleDirection {
  normal, // original
  mirrored, // flipped direction
}

class RoundedSlantedRectangle extends CustomClipper<Path> {
  final double cornerRadius;
  final SlantedRectangleDirection direction;

  RoundedSlantedRectangle({
    this.cornerRadius = 20.0,
    this.direction = SlantedRectangleDirection.normal,
  });

  @override
  Path getClip(Size size) {
    // Keep your original points
    List<Offset> points = [
      const Offset(0, -1), // top
      const Offset(1, -1), // right
      const Offset(1, 0), // right
      const Offset(0, 1), // bottom
      const Offset(-1, 1), // bottom
      const Offset(-1, 0), // bottom
    ];

    // Mirror horizontally if direction is mirrored
    if (direction == SlantedRectangleDirection.mirrored) {
      points = points.map((p) => Offset(-p.dx, p.dy)).toList();
    }

    final polygon = Polygon(points);

    // Compute the path scaled to the widget size
    return polygon.computePath(rect: Offset.zero & size, radius: cornerRadius);
  }

  @override
  bool shouldReclip(covariant RoundedSlantedRectangle oldClipper) {
    return oldClipper.cornerRadius != cornerRadius ||
        oldClipper.direction != direction;
  }
}

class FourPetalFlower extends CustomClipper<Path> {
  final double radius;

  FourPetalFlower({this.radius = 20.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double w = size.width;
    final double h = size.height;
    final Offset center = Offset(w / 2, h / 2);

    // Start at top middle
    path.moveTo(center.dx, 0);

    // Top-right curve
    path.arcToPoint(
      Offset(w, center.dy),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Bottom-right curve
    path.arcToPoint(
      Offset(center.dx, h),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Bottom-left curve
    path.arcToPoint(
      Offset(0, center.dy),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Top-left curve
    path.arcToPoint(
      Offset(center.dx, 0),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant FourPetalFlower oldClipper) {
    return oldClipper.radius != radius;
  }
}

class CircleGridClipper extends CustomClipper<Path> {
  final int circlesPerLine; // e.g., 2, 3, 4
  final double gap; // gap between circles

  CircleGridClipper({required this.circlesPerLine, this.gap = 8.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double totalGap = gap * (circlesPerLine - 1);
    final double circleSize = (size.width - totalGap) / circlesPerLine;

    for (int row = 0; row < circlesPerLine; row++) {
      for (int col = 0; col < circlesPerLine; col++) {
        final double x = col * (circleSize + gap) + circleSize / 2;
        final double y = row * (circleSize + gap) + circleSize / 2;
        path.addOval(
          Rect.fromCircle(center: Offset(x, y), radius: circleSize / 2),
        );
      }
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CircleGridClipper oldClipper) {
    return oldClipper.circlesPerLine != circlesPerLine || oldClipper.gap != gap;
  }
}

//

/*

class NumbersClipper extends CustomClipper<Path> {
  final double cornerRadius;
  final int number;

  NumbersClipper({
    this.cornerRadius = 20.0,
    this.number = 0,
  });

  @override
  Path getClip(Size size) {
    final double sq = 1 / 4;

   if (number == 0) {
  final outerPath = Polygon([
    Offset(-2 * sq, -1),
    Offset(2 * sq, -1),
    Offset(2 * sq, 1),
    Offset(-2 * sq, 1),
  ]).computePath(
    rect: Offset.zero & size,
    radius: cornerRadius,
  );

  final innerPath = Polygon([
    Offset(-sq/2, -1 + sq/2),
    Offset(sq/2, -1 + sq/2),
    Offset(sq/2, 1 - sq/2),
    Offset(-sq/2, 1 - sq/2),
  ]).computePath(
    rect: Offset.zero & size,
    radius: cornerRadius * 0.5, // ⭐ مهم جدا
  );

  return Path.combine(
    PathOperation.difference,
    outerPath,
    innerPath,
  );
}

   else if (number == 1) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 2) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 3) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 4) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 5) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 6) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 7) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 8) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else if (number == 9) {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   else  {
      // ⬛ الشكل الأساسي
      List<Offset> points_0 = [
        Offset(-2 * sq, -1),
        Offset(2 * sq, -1),
        Offset(2 * sq, 1),
        Offset(-2 * sq, 1),
      ];

      // ◻ الثقب الداخلي
      List<Offset> points_0_hole = [
        Offset(-sq, -1 + sq),
        Offset(sq, -1 + sq),
        Offset(sq, 1 - sq),
        Offset(-sq, 1 - sq),
      ];

      final basePath = Polygon(points_0).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      final holePath = Polygon(points_0_hole).computePath(
        rect: Offset.zero & size,
        radius: cornerRadius,
      );

      return Path.combine(
        PathOperation.difference,
        basePath,
        holePath,
      );
    }
   

  
  }

  @override
  bool shouldReclip(covariant NumbersClipper oldClipper) {
    return oldClipper.number != number ||
        oldClipper.cornerRadius != cornerRadius;
  }
}

*/
enum ThreeRoundedPillDirection {
  vertical,
  horizontal,
}

class ThreeRoundedPill extends CustomClipper<Path> {
  final double gap;
  final ThreeRoundedPillDirection direction;

  ThreeRoundedPill({
    this.gap = 12.0,
    this.direction = ThreeRoundedPillDirection.vertical,
  });

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double w = size.width;
    final double h = size.height;

    // ================= SIZES =================
    final double centerWidth = w * 0.30;
    final double sideWidth = w * 0.14;

    final double centerHeight = h * 0.90;
    final double sideHeight = h * 0.55;

    final Offset center = Offset(w / 2, h / 2);

    // ================= CENTER PILL =================
    _addVerticalPill(
      path,
      center: center,
      width: centerWidth,
      height: centerHeight,
    );

    // ================= LEFT PILL =================
    _addVerticalPill(
      path,
      center: Offset(
        center.dx - centerWidth / 2 - sideWidth / 2 - gap,
        center.dy,
      ),
      width: sideWidth,
      height: sideHeight,
    );

    // ================= RIGHT PILL =================
    _addVerticalPill(
      path,
      center: Offset(
        center.dx + centerWidth / 2 + sideWidth / 2 + gap,
        center.dy,
      ),
      width: sideWidth,
      height: sideHeight,
    );

    // ================= ROTATE IF HORIZONTAL =================
    if (direction == ThreeRoundedPillDirection.horizontal) {
      final Matrix4 m = Matrix4.identity()
        ..translate(w / 2, h / 2)
        ..rotateZ(pi / 2)
        ..translate(-w / 2, -h / 2);

      return path.transform(m.storage);
    }

    return path;
  }

  void _addVerticalPill(
    Path path, {
    required Offset center,
    required double width,
    required double height,
  }) {
    final double r = width / 2;

    final double left = center.dx - width / 2;
    final double right = center.dx + width / 2;
    final double top = center.dy - height / 2;
    final double bottom = center.dy + height / 2;

    // ✅ Start at top-right (exact match with end)
    path.moveTo(right, top + r);

    // ─── Top semicircle
    path.arcTo(
      Rect.fromLTWH(left, top, width, width),
      0,
      -pi,
      false,
    );

    // ─── Left side
    path.lineTo(left, bottom - r);

    // ─── Bottom semicircle
    path.arcTo(
      Rect.fromLTWH(left, bottom - width, width, width),
      pi,
      -pi,
      false,
    );

    // ─── Right side → back to start point
    path.lineTo(right, top + r);

    path.close();
  }

  @override
  bool shouldReclip(covariant ThreeRoundedPill oldClipper) {
    return oldClipper.gap != gap ||
        oldClipper.direction != direction;
  }
}
