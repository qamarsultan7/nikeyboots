import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

class OnboaringShoes extends StatelessWidget {
  final String imagePath;
  final isSecond;
  final BoxConstraints constraints;
  const OnboaringShoes({
    super.key,
    required this.imagePath,
    required this.isSecond, required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FittedBox(
          child: Text(
            'Nikee',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.2),
              fontSize: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * .3,
          width: double.infinity,
          child: FittedBox(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        isSecond
            ? Positioned(
                bottom: -38,
                right: 5,
                child: Image.asset('Assets/images/onboard_2.1.png'))
            : const SizedBox.shrink(),
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            maxRadius: 10,
            backgroundColor: KCONTANTBLUECOLOR.withOpacity(.5),
          ),
        ),
        Positioned(
          bottom: 25,
          right: 70,
          child: CircleAvatar(
            maxRadius: 10,
            backgroundColor: KCONTANTBLUECOLOR.withOpacity(.5),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 5,
          child: CircleAvatar(
            maxRadius: 10,
            backgroundColor: KCONTANTBLUECOLOR.withOpacity(.5),
          ),
        )
      ],
    );
  }
}
