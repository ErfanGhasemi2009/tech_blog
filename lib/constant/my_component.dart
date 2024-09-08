import 'package:flutter/material.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.2,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}
