import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/constants.dart';

class ProfileView extends StatefulWidget {
  final BoxConstraints size;
  const ProfileView({Key? key, required this.size}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late SlideTransitionController profileTansition;
  late SlideTransitionController nameFieldTansition;
  @override
  void initState() {
    profileTansition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(0, -2));
    profileTansition.controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: KCONSTANTPADDING,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: SlideTransition(
                      position: profileTansition.animation,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              radius: widget.size.maxWidth * .2,
                              backgroundImage: const AssetImage(
                                  'Assets/images/Profile Pic.jpg'),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: KCONTANTBLUECOLOR,
                            child: SvgPicture.asset(
                              'Assets/Icons/camera.svg',
                              width: widget.size.maxWidth * .06,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Full name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const TextField(
                  text: 'QaMaR SulTaN',
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const TextField(
                  text: 'qamarsultan312278@gmail.com',
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const TextField(
                  text: '***********',
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
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
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.maxWidth * .05),
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String text;
  const TextField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: KCONSTANTWHITECOLOR,
        hintText: text,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: KCONSTANTWHITECOLOR)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: KCONSTANTWHITECOLOR)),
        focusColor: KCONSTANTWHITECOLOR,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: KCONSTANTWHITECOLOR)),
      ),
    );
  }
}
