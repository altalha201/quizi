import 'package:flutter/material.dart';

import '../../utility/colors.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard(
      {Key? key,
      this.onTap,
      required this.imageURL,
      this.selected,
      this.radius})
      : super(key: key);

  final VoidCallback? onTap;
  final double? radius;
  final String imageURL;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: radius ?? 25,
          backgroundImage: NetworkImage(imageURL),
          backgroundColor: colorPrimary,
          child: Visibility(
            visible: selected ?? false,
            child: const Icon(
              IconData(0xe156, fontFamily: 'MaterialIcons'),
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}
