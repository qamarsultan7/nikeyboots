// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

Row onboard_description(
    BuildContext context, int selectedpage, VoidCallback onpress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
            margin: const EdgeInsets.all(1),
            height: 6,
            width: index == selectedpage ? 40 : 10,
            decoration: BoxDecoration(
                color: index == selectedpage
                    ? KCONTANTBLUECOLOR
                    : KCONTANTBLUECOLOR.withOpacity(.4),
                borderRadius: BorderRadius.circular(20)),
          );
        }),
      ),
      GestureDetector(
        onTap: onpress,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
              color: KCONTANTBLUECOLOR,
              borderRadius: BorderRadius.circular(50)),
          child: const FittedBox(
              child: Text(
            'Get Started',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          )),
        ),
      )
    ],
  );
}
