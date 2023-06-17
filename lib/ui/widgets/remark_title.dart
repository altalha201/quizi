import 'package:flutter/material.dart';

import '../utility/colors.dart';


class RemarkTitle extends StatelessWidget {
  const RemarkTitle({
    Key? key,
    required this.label,
    required this.onSeeAllTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: colorPrimaryBackground,
            ),
          ),
          TextButton(
            onPressed: onSeeAllTap,
            child: const Text(
              "See All",
            ),
          ),
        ],
      ),
    );
  }
}
