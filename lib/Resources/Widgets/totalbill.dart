import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

class TotalbillBottom extends StatelessWidget {
  const TotalbillBottom({
    super.key,
    required this.size,
    required this.onpress,
    required this.buttontitle,
    required this.bill,
  });
  final String buttontitle;
  final VoidCallback onpress;
  final double bill;
  final BoxConstraints size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: KCONSTANTWHITECOLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      width: double.infinity,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        TotalBill(
          size: size,
          title: 'Subtotal',
          bill: bill.toString(),
        ),
        SizedBox(
          height: size.maxHeight * .01,
        ),
        TotalBill(
          size: size,
          title: 'Shipping',
          bill: '\$200',
        ),
        SizedBox(
          height: size.maxHeight * .01,
        ),
        Divider(
          thickness: 2,
          color: Colors.black.withOpacity(.1),
        ),
        SizedBox(
          height: size.maxHeight * .01,
        ),
        TotalBill(
          size: size,
          title: 'Total',
          bill: (bill + 200).toString(),
        ),
        SizedBox(
          height: size.maxHeight * .02,
        ),
        GestureDetector(
          onTap: onpress,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            decoration: BoxDecoration(
                color: KCONTANTBLUECOLOR,
                borderRadius: BorderRadius.circular(50)),
            width: double.infinity,
            child: Center(
                child: FittedBox(
              child: Text(
                buttontitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.maxWidth * .05),
              ),
            )),
          ),
        )
      ]),
    );
  }
}

class TotalBill extends StatelessWidget {
  const TotalBill({
    super.key,
    required this.title,
    required this.bill,
    required this.size,
  });
  final String title;
  final BoxConstraints size;
  final String bill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: size.maxWidth * .05, fontWeight: FontWeight.w400),
          ),
          Text(
            bill,
            style: TextStyle(
                fontSize: size.maxWidth * .06, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
