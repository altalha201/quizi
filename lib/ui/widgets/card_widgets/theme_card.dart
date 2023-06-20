import 'package:flutter/material.dart';

import '../../utility/colors.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({Key? key, required this.imgURL, this.selected, this.onTap})
      : super(key: key);

  final String imgURL;
  final bool? selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: (selected ?? false) ? colorPrimary : Colors.grey.shade200,
                  width: 2,),
              image: DecorationImage(image: NetworkImage(imgURL))),
        ),
      ),
    );
  }
}
