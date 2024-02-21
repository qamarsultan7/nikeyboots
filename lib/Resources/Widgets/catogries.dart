import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/constants.dart';

Widget categories(BoxConstraints size, bool selected, String title, String img) {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? KCONTANTBLUECOLOR : Colors.transparent,
        shape: BoxShape.rectangle),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
        child: FittedBox(
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: KCONSTANTWHITECOLOR,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        img,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
              selected
                  ? SizedBox(
                      width: size.maxWidth * 0.02,
                    )
                  : const SizedBox.shrink(),
              selected
                  ? Text(
                      title,
                      style: const TextStyle(
                          color: KCONSTANTWHITECOLOR,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )
                  : const SizedBox.shrink(),
              selected
                  ? SizedBox(
                      width: size.maxWidth * 0.03,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        )),
  );
}
