import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/main.dart';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Utils {
  static final PageController pageController = PageController(initialPage: 0);

  gotoPage(int index) {
    pageController.jumpToPage(index);
  }

  static void showAlertDialouge(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: FittedBox(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: KCONTANTBLUECOLOR.withOpacity(.4),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset('Assets/images/Nikee/congrats.png'),
                      ),
                    ),
                  ),
                ),
                const FittedBox(
                  child: Text(
                    'Your Payment Is\n Successfull',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // Utils.pageController.jumpToPage(0);
                  RestartWidget.restartApp(context);
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   SystemChannels.platform
                  //       .invokeMethod<void>('SystemNavigator.pop');
                  // });
                  // Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   slideTransitionPageRoute(
                  //     const MyApp(),
                  //     const Offset(1.0, 0.0),
                  //     Offset.zero,
                  //     Curves.easeInOut,
                  //     const Duration(milliseconds: 500),
                  //   ),
                  // );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  decoration: BoxDecoration(
                      color: KCONTANTBLUECOLOR,
                      borderRadius: BorderRadius.circular(50)),
                  width: double.infinity,
                  child: const FittedBox(
                      child: Text(
                    'Back To Shopping',
                    style: TextStyle(
                        color: KCONSTANTWHITECOLOR,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          );
        });
  }

  static void showAdressBottomSheet(BuildContext context, BoxConstraints size) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    const Textformfild(
                      hint: 'Country/Region',
                    ),
                    const Textformfild(
                      hint: 'First Name',
                    ),
                    const Textformfild(
                      hint: 'Last Name',
                    ),
                    const Textformfild(
                      hint: 'Address',
                    ),
                    const Textformfild(
                      hint: 'Postal Code',
                    ),
                    const Textformfild(
                      hint: 'City',
                    ),
                    const Textformfild(
                      hint: 'Phone Number',
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: KCONTANTBLUECOLOR,
                          borderRadius: BorderRadius.circular(30)),
                      width: double.infinity,
                      height: size.maxHeight * .07,
                      child: const FittedBox(
                          child: Center(
                              child: Text(
                        'Update',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showToastMessage(
      String title, Color color, BuildContext context) {
    showToast(title,
        backgroundColor: color,
        textStyle: const TextStyle(
          color: KCONSTANTWHITECOLOR,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        fullWidth: true,
        duration: const Duration(milliseconds: 1400),
        curve: Curves.easeInCubic,
        position: StyledToastPosition.top, animationBuilder: (
      BuildContext context,
      AnimationController controller,
      Duration duration,
      Widget child,
    ) {
      return SlideTransition(
        position: getAnimation<Offset>(
            const Offset(0.0, -5.0), const Offset(0, 0), controller,
            curve: Curves.easeInOutCirc),
        child: child,
      );
    }, reverseAnimBuilder: (
      BuildContext context,
      AnimationController controller,
      Duration duration,
      Widget child,
    ) {
      return SlideTransition(
        position: getAnimation<Offset>(
            const Offset(0.0, 0.0), const Offset(0.0, -8.0), controller,
            curve: Curves.easeInOut),
        child: child,
      );
    }, context: context);

    // showToast("Added",
    //     backgroundColor: KCONTANTBLUECOLOR,
    //     textStyle: const TextStyle(
    //       color: KCONSTANTWHITECOLOR,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20,
    //     ),
    //     fullWidth: true,
    //     duration: const Duration(milliseconds: 1400),
    //     curve: Curves.easeInCubic,
    //     position: StyledToastPosition.top, animationBuilder: (
    //   BuildContext context,
    //   AnimationController controller,
    //   Duration duration,
    //   Widget child,
    // ) {
    //   return SlideTransition(
    //     position: getAnimation<Offset>(
    //         const Offset(0.0, -5.0), const Offset(0, 0), controller,
    //         curve: Curves.easeInOutCirc),
    //     child: child,
    //   );
    // }, reverseAnimBuilder: (
    //   BuildContext context,
    //   AnimationController controller,
    //   Duration duration,
    //   Widget child,
    // ) {
    //   return SlideTransition(
    //     position: getAnimation<Offset>(
    //         const Offset(0.0, 0.0), const Offset(0.0, -8.0), controller,
    //         curve: Curves.easeInOut),
    //     child: child,
    //   );
    // }, context: context);
  }
}

class Textformfild extends StatelessWidget {
  final String hint;
  const Textformfild({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            hintText: hint),
      ),
    );
  }
}
