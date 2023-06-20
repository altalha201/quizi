import 'package:flutter/material.dart';

import '../utility/colors.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key, this.onTap, required this.label,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shadowColor: colorPrimary.withOpacity(0.3),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          color: colorPrimary,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ),
      ),
    );
  }
}