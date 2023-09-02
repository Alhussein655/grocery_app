import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(12),
      child: Icon(
        IconlyLight.arrowLeft2,
        color: color,
      ),
    );
  }
}
