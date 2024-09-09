import 'package:flutter/material.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';

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

class TagItemHomeScreen extends StatelessWidget {
  const TagItemHomeScreen({
    super.key, required this.titleItem,
    
  });

  final String titleItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Row(
        children: [
          Assets.icons.hashtagicon.image(width: 16, height: 16),
          const SizedBox(
            width: 8,
          ),
          Text(
            titleItem,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}
