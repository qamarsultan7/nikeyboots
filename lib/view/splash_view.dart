import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/Components/onboarding_shoes.dart';
import 'package:nikeyboots/Resources/Widgets/onboard_description.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/view/home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int selectedpage = 0;
  late SlideTransitionController _slideTransition;
  @override
  void initState() {
    _slideTransition = SlideTransitionController(
        this, const Duration(milliseconds: 1200), const Offset(1, 0));
    _slideTransition.controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        return SlideTransition(
          position: _slideTransition.animation,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 36),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('Assets/images/onboard_circle.png'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: constrains.maxHeight * .57,
                      child: PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: onboarding.length,
                          itemBuilder: (context, snapshot) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OnboaringShoes(
                                    constraints: constrains,
                                    imagePath: onboarding[snapshot].image,
                                    isSecond: snapshot == 1 ? true : false),
                                // SizedBox(
                                //   height: constrains.maxHeight * .0,
                                // ),
                                FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          onboarding[snapshot].heading,
                                          style: TextStyle(
                                              fontSize:
                                                  constrains.maxHeight * .03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          onboarding[snapshot].heading,
                                          style: TextStyle(
                                              fontSize:
                                                  constrains.maxHeight * .02,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
                Flexible(
                  child: onboard_description(context, selectedpage, () {
                    setState(() {
                      if (selectedpage < 2) {
                        selectedpage++;
                        _pageController.animateToPage(selectedpage,
                            duration: const Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                      } else {
                        Navigator.push(
                          context,
                          slideTransitionPageRoute(
                            const HomeScreen(),
                            const Offset(1.0, 0.0),
                            Offset.zero,
                            Curves.easeInOut,
                            const Duration(milliseconds: 500),
                          ),
                        );
                      }
                    });
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
