import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/services/utils.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final theme = utils.getTheme;
    final color = utils.color;
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
