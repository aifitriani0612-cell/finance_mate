import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSmall;

  const GridMenuItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.isSmall = false, // default: false agar tetap kompatibel
  });

  @override
  Widget build(BuildContext context) {
    // Sesuaikan ukuran ikon & teks
    final double iconSize = isSmall ? 40 : 50;
    final double fontSize = isSmall ? 12 : 16;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
