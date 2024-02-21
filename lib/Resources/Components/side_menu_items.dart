

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/constants.dart';

class SidemenuItems extends StatelessWidget {
  const SidemenuItems({
    super.key,
    required this.selected,
    required this.onpress,
    required this.title,
    required this.icon,
    required this.size,
  });
  final VoidCallback onpress;
  final bool selected;
  final String title;
  final String icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(5),
        decoration: selected
            ? BoxDecoration(
                border: Border.all(color: KCONSTANTWHITECOLOR.withOpacity(.3)),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(179, 0, 0, 0).withOpacity(.4),
              )
            : const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon,color:selected?KCONTANTBLUECOLOR: KCONSTANTWHITECOLOR.withOpacity(.4),),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style:  TextStyle(
                  fontSize: 18,
                  color:selected?KCONTANTBLUECOLOR: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
