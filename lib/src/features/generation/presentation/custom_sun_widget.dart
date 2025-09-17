import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

class Moment {
  final String label;
  final double percentage;
  final String iconAsset;
  final IconData iconData;

  Moment({
    required this.label,
    required this.percentage,
    required this.iconAsset,
    required this.iconData,
  });
}

class ArcPainter extends CustomPainter {
  final Color color;
  final double arcHeightFactor;
  final double radius;
  final double iconSize;

  ArcPainter({
    required this.color,
    required this.arcHeightFactor,
    required this.radius,
    required this.iconSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color.withOpacity(1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();

    // Générer les points de l'arc en utilisant les mêmes calculs que pour les icônes
    const int numberOfPoints = 100;
    for (int i = 0; i <= numberOfPoints; i++) {
      double angle = pi * i / numberOfPoints;
      double x = (size.width / 2) + radius * cos(angle);
      double y = size.height - (radius * sin(angle) / arcHeightFactor);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Dessiner le chemin pointillé
    Path dashPath = Path();
    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final double currentDashLength =
            min(dashWidth, pathMetric.length - distance);
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + currentDashLength),
          Offset.zero,
        );
        distance += currentDashLength + dashSpace;
      }
      distance = 0.0; // Réinitialiser la distance pour chaque métrique
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SunPathSelector extends StatefulWidget {
  const SunPathSelector({Key? key}) : super(key: key);

  @override
  _SunPathSelectorState createState() => _SunPathSelectorState();
}

class _SunPathSelectorState extends State<SunPathSelector> {
  double _angle = pi; // Angle initial (gauche)

  List<Moment> moments = [
    Moment(
        label: 'Nuit',
        percentage: 0.0,
        iconAsset: 'assets/icons/time_day/night.png',
        iconData: Icons.nights_stay),
    Moment(
        label: 'Lever du soleil',
        percentage: 0.15,
        iconAsset: 'assets/icons/time_day/sunset.png',
        iconData: Icons.wb_twilight),
    Moment(
        label: 'Matin',
        percentage: 0.3,
        iconAsset: 'assets/icons/time_day/sunny.png',
        iconData: Icons.wb_sunny),
    Moment(
        label: 'Midi',
        percentage: 0.5,
        iconAsset: 'assets/icons/time_day/sunny.png',
        iconData: Icons.wb_sunny),
    Moment(
        label: 'Après-midi',
        percentage: 0.7,
        iconAsset: 'assets/icons/time_day/sunny.png',
        iconData: Icons.wb_sunny),
    Moment(
        label: 'Coucher du soleil',
        percentage: 0.85,
        iconAsset: 'assets/icons/time_day/sunset.png',
        iconData: Icons.wb_twilight),
    Moment(
        label: 'Nuit',
        percentage: 1.0,
        iconAsset: 'assets/icons/time_day/night.png',
        iconData: Icons.nights_stay),
  ];

  void _onPanUpdate(
      DragUpdateDetails details, Size size, double arcHeightFactor) {
    final Offset localPosition = details.localPosition;
    final double centerX = size.width / 2;
    final double centerY = size.height;
    final double dx = localPosition.dx - centerX;
    final double dy = (centerY - localPosition.dy) * arcHeightFactor;

    double angle = atan2(dy, dx);

    if (dy >= 0) {
      if (angle < 0) angle = 0;
      if (angle > pi) angle = pi;

      setState(() {
        _angle = angle;
      });
    }
  }

  Moment _getCurrentMoment() {
    double pourcentage = 1 - (_angle / pi);
    Moment closestMoment = moments.first;
    double minDifference = double.infinity;

    for (var moment in moments) {
      double diff = (pourcentage - moment.percentage).abs();
      if (diff < minDifference) {
        minDifference = diff;
        closestMoment = moment;
      }
    }
    return closestMoment;
  }

  List<Widget> _buildGreyedOutIcons(
      Size size, double radius, double iconSize, double arcHeightFactor) {
    return moments.map((moment) {
      double angle = pi * (1 - moment.percentage);
      double x = (size.width / 2) + radius * cos(angle) - (iconSize / 2);
      double y = size.height -
          (radius * sin(angle) / arcHeightFactor) -
          (iconSize / 2);

      return Positioned(
        left: x,
        top: y,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _angle = angle;
            });
          },
          child: Image.asset(
            moment.iconAsset,
            width: iconSize,
            height: iconSize,
            opacity: const AlwaysStoppedAnimation(0.4),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        if (width == double.infinity) {
          width = MediaQuery.of(context).size.width * 0.8;
        }
        if (height == double.infinity) {
          height = width / 2;
        }

        final Size size = Size(width, height);
        final double iconSize = height / 5;
        final double radius = (size.width / 2) - (iconSize / 2);

        double arcHeightFactor = 1; // Ajuster ce facteur pour aplatir l'arc

        if (radius <= 0) {
          return SizedBox();
        }

        Moment currentMoment = _getCurrentMoment();

        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: width,
              height: height + (iconSize / 2),
              child: GestureDetector(
                onPanUpdate: (details) =>
                    _onPanUpdate(details, size, arcHeightFactor),
                child: CustomPaint(
                  size: Size(width, height),
                  painter: ArcPainter(
                    color: Colors.grey[300]!,
                    arcHeightFactor: arcHeightFactor,
                    radius: radius,
                    iconSize: iconSize,
                  ),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      // Icônes grises
                      ..._buildGreyedOutIcons(
                          size, radius, iconSize, arcHeightFactor),
                      // Icône mobile
                      Positioned(
                        left: (size.width / 2) +
                            radius * cos(_angle) -
                            (iconSize / 2),
                        top: size.height -
                            (radius * sin(_angle) / arcHeightFactor) -
                            (iconSize / 2),
                        child: Image.asset(
                          currentMoment.iconAsset,
                          width: iconSize,
                          height: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(currentMoment.label,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        );
      },
    );
  }
}
