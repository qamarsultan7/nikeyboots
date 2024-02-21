

 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/constants.dart';

Widget bottomAppbarIcons(String icon, VoidCallback onpress,bool slected) {
    return GestureDetector(
      onTap: onpress,
      child: SvgPicture.asset(icon,color: slected?KCONTANTBLUECOLOR:Colors.grey,height:slected?35 :30,width:slected?35 : 30,),
    );
  }