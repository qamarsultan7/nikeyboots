import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: KCONSTANTWHITECOLOR, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Choice',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: KCONTANTBLUECOLOR),
              ),
              Text(
                'Nike Air Jordan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$5.77',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            width: size.width * .4,
            child: FittedBox(
                child: Image.asset(
              'Assets/images/Nikee/nikee_2.png',
            )),
          )
        ],
      ),
    );
  }
}
