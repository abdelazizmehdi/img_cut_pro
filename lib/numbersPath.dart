
// class NumbersClipper extends CustomClipper<Path> {
//   final double cornerRadius;
//   final int number;

//   NumbersClipper({this.cornerRadius = 20.0, this.number = 0});

//   @override
//   Path getClip(Size size) {
//     final double sq = 1 / 4;

//     List<Offset> points_0 = [
//       Offset(0, -1 + sq),
//       Offset(-sq * 2, -1 + 3 * sq),

//       Offset(-sq * 2.5, -1 + 2 * sq),

//       Offset(0, -1),
//       Offset(sq, -1),
//       Offset(sq, 1 - sq),
//       Offset(sq * 2, 1 - sq),
//       Offset(sq * 2, 1),
//       Offset(-sq, 1),
//       Offset(-sq, 1 - sq),
//       Offset(0, 1 - sq),
//     ];
//     List<Offset> points_1 = [
//       const Offset(-1, -1),
//       const Offset(-1, 1),
//       const Offset(1, 1),
//       const Offset(1, -1),
//     ];
//     List<Offset> points_2 = [
//       const Offset(-0.2, 0),
//       const Offset(0.2, 0),
//       const Offset(0.2, 0.2),
//       const Offset(-0.2, 0.2),
//     ];
//     List<Offset> points_3 = [const Offset(0, -1)];
//     List<Offset> points_4 = [const Offset(0, -1)];
//     List<Offset> points_5 = [const Offset(0, -1)];
//     List<Offset> points_6 = [const Offset(0, -1)];
//     List<Offset> points_7 = [const Offset(0, -1)];
//     List<Offset> points_8 = [const Offset(0, -1)];
//     List<Offset> points_9 = [const Offset(0, -1)];

//     // choose points safely
//     final List<Offset> selectedPoints = switch (number) {
//       0 => points_0,
//       1 => points_1,
//       2 => points_2,
//       3 => points_3,
//       4 => points_4,
//       5 => points_5,
//       6 => points_6,
//       7 => points_7,
//       8 => points_8,
//       9 => points_9,
//       _ => points_0, // fallback (important)
//     };

//     // final polygon = Polygon(selectedPoints);
    
//      final basePolygon = Polygon(points_1);
//   final basePath = basePolygon.computePath(
//     rect: Offset.zero & size,
//     radius: cornerRadius,
//   );

//   // 2️⃣ polygon صغير (الثقب)
//   final holePolygon = Polygon(points_2);
//   final holePath = holePolygon.computePath(
//     rect: Offset.zero & size,
//     radius: cornerRadius,
//   );

//   // 3️⃣ طرح (difference)
//   final result = Path.combine(
//     PathOperation.difference,
//     basePath,
//     holePath,
//   );

//   return result;

//     // return polygon.computePath(rect: Offset.zero & size, radius: cornerRadius);
//   }

//   @override
//   bool shouldReclip(covariant NumbersClipper oldClipper) {
//     return oldClipper.number != number ||
//         oldClipper.cornerRadius != cornerRadius;
//   }
// }
