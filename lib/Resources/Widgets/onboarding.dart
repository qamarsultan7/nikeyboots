import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

Stack midshoes(Size size) {
  return Stack(
    alignment: Alignment.center,
    children: [
      FittedBox(
        child: Text(
          'Nikee',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.2), fontSize: size.height),
        ),
      ),
      SizedBox(
          height: size.height * .3,
          width: double.infinity,
          child: Image.asset(
            'Assets/images/onboard_2.png',
            fit: BoxFit.cover,
          )),
      Positioned(
          bottom: -38,
          right: 5,
          child: Image.asset('Assets/images/onboard_2.1.png')),
      Align(
        alignment: Alignment.topLeft,
        child: circleavatar(),
      ),
      Positioned(
        bottom: 25,
        right: 70,
        child: circleavatar(),
      ),
      Positioned(
        left: 25,
        bottom: 5,
        child: circleavatar(),
      )
    ],
  );
}

CircleAvatar circleavatar() {
  return CircleAvatar(
    maxRadius: 10,
    backgroundColor: KCONTANTBLUECOLOR.withOpacity(.5),
  );
}

Stack firstshoeswidgets(Size size) {
  return Stack(
    alignment: Alignment.center,
    children: [
      FittedBox(
        child: Text(
          'Nikee',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.2), fontSize: size.height),
        ),
      ),
      SizedBox(
          height: size.height * .3,
          width: double.infinity,
          child: Image.asset(
            'Assets/images/onboard_1.png',
            fit: BoxFit.cover,
          )),
      Align(
        alignment: Alignment.topLeft,
        child: circleavatar(),
      ),
      Positioned(
        bottom: 25,
        right: 70,
        child: circleavatar(),
      ),
      Positioned(
        left: 25,
        bottom: 5,
        child: circleavatar(),
      )
    ],
  );
}

Stack shoeswidgets(Size size) {
  return Stack(
    alignment: Alignment.center,
    children: [
      FittedBox(
        child: Text(
          'Nikee',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.2), fontSize: size.height),
        ),
      ),
      SizedBox(
          height: size.height * .3,
          width: double.infinity,
          child: Image.asset(
            'Assets/images/onboard_3.png',
            fit: BoxFit.cover,
          )),
      Align(
        alignment: Alignment.topLeft,
        child: circleavatar(),
      ),
      Positioned(
        bottom: 25,
        right: 70,
        child: circleavatar(),
      ),
      Positioned(
        left: 25,
        bottom: 5,
        child: circleavatar(),
      )
    ],
  );
}
