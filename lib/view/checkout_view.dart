import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/Components/custom_appbar.dart';
import 'package:nikeyboots/Resources/Widgets/totalbill.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/utils.dart';

class CheckoutView extends StatelessWidget {
  final double totalBill;
  final BoxConstraints size;
  const CheckoutView({Key? key, required this.size, required this.totalBill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onpress: () {
          Navigator.pop(context);
        },
        lefticon: 'Assets/Icons/Arrow.svg',
        rightIcon: const CircleAvatar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: size.maxHeight * .57,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: KCONSTANTWHITECOLOR,
                borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FittedBox(
                    child: Text(
                      'Contact Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: KCONTANTSCAFFOLDCOLOR,
                      child: SvgPicture.asset('Assets/Icons/phone.svg'),
                    ),
                    title: const FittedBox(
                        child: Text(
                      'qamarsultan312278@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    subtitle: const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: SvgPicture.asset('Assets/Icons/edit.svg'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: KCONTANTSCAFFOLDCOLOR,
                      child: SvgPicture.asset('Assets/Icons/phone.svg'),
                    ),
                    title: const Text(
                      '+88-697-899667',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: SvgPicture.asset('Assets/Icons/edit.svg'),
                  ),
                  ListTile(
                    onTap: () {
                      Utils.showAdressBottomSheet(context, size);
                    },
                    title: const Text(
                      'Address',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Islambad,Punjab Pakistan'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: size.maxHeight * .15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('Assets/images/map.png')),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: SvgPicture.asset('Assets/images/map2.svg')),
                  ),
                  const FittedBox(
                    child: Text(
                      'Payment Method',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: KCONTANTSCAFFOLDCOLOR,
                      child: SvgPicture.asset('Assets/Icons/phone.svg'),
                    ),
                    title: const Text(
                      'Credit Card',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      '*******-872874',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: TotalbillBottom(
                bill: totalBill,
                buttontitle: 'Payment',
                size: size,
                onpress: () {
                  Utils.showAlertDialouge(context);
                },
              ))
        ],
      ),
    );
  }
}
