import 'package:flutter/material.dart';

import '../../utility/colors.dart';
import 'theme_card.dart';

class QuizViewCard extends StatelessWidget {
  const QuizViewCard({
    Key? key,
    required this.themeUrl,
    required this.title,
    required this.creatorName,
    this.isLive,
    this.points,
    this.fromDetails,
  }) : super(key: key);

  final String themeUrl, title, creatorName;
  final bool? isLive, fromDetails;
  final int? points;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: colorPrimary, width: 2),
      ),
      child: Row(
        children: [
          ThemeCard(imgURL: themeUrl),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                creatorName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Visibility(
                  visible: isLive ?? false, child: const SizedBox(height: 16)),
              Visibility(
                  visible: isLive ?? false,
                  child: Text("Live Quiz",
                      style: TextStyle(color: Colors.red.shade600))),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: fromDetails ?? false,
            child: const SizedBox(
              width: 16.0,
            ),
          ),
          Visibility(
              visible: fromDetails ?? false,
              child: Column(
                children: [
                  Text(
                    "${points ?? 0}",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: colorPrimary),
                  ),
                  const Text(
                    "Points",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: colorPrimary),
                  )
                ],
              )),
          const SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }
}
