import 'package:flutter/material.dart';

class CloseCircleButton extends StatelessWidget {
  const CloseCircleButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 24,
          height: 24,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white,
              border: Border.all(color: const Color(0xffD9D0E3))),
            child: const Icon(
              Icons.arrow_left,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}