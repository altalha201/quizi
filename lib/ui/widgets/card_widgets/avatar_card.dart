import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard(
      {Key? key, required this.onTap, required this.imageURL, this.selected})
      : super(key: key);

  final VoidCallback onTap;
  final String imageURL;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(imageURL),
          child: Visibility(
            visible: selected ?? false,
            child: const Icon(
              IconData(0xe156, fontFamily: 'MaterialIcons'),
              size: 72,
            ),
          ),
        ),
      ),
    );
  }
}
