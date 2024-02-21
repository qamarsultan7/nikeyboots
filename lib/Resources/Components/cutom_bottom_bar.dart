// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Bloc/bloc/bottom_navigation_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Components/custom_painter.dart';
import 'package:nikeyboots/Resources/Widgets/bottom_icons.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/view/cart_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final PageController pageController;
  const CustomBottomNavigationBar({
    super.key,
    required this.size,
    required this.pageController,
  });

  final BoxConstraints size;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(35, 236, 236, 236),
        Color.fromARGB(255, 193, 194, 195),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      height: widget.size.maxHeight * .15,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(widget.size.maxWidth,
                (widget.size.maxHeight * 0.17).toDouble()),
            painter: RPSCustomPainter(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                  buildWhen: (previous, current) => current != previous,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widget.size.maxWidth * .34,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              bottomAppbarIcons('Assets/Icons/home.svg', () {
                                context
                                    .read<BottomNavigationBloc>()
                                    .add(const ChangePage(page: 0));
                                widget.pageController.jumpToPage(0);
                              }, state.seletedPage == 0),
                              SizedBox(
                                width: widget.size.maxWidth * .13,
                              ),
                              bottomAppbarIcons('Assets/Icons/heart.svg', () {
                                context
                                    .read<BottomNavigationBloc>()
                                    .add(const ChangePage(page: 1));
                                widget.pageController.jumpToPage(1);
                              }, state.seletedPage == 1),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: widget.size.maxWidth * .34,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              bottomAppbarIcons(
                                  'Assets/Icons/notifications.svg', () {
                                context
                                    .read<BottomNavigationBloc>()
                                    .add(const ChangePage(page: 2));
                                widget.pageController.jumpToPage(2);
                              }, state.seletedPage == 2),
                              SizedBox(
                                width: widget.size.maxWidth * .15,
                              ),
                              bottomAppbarIcons('Assets/Icons/user.svg', () {
                                context
                                    .read<BottomNavigationBloc>()
                                    .add(const ChangePage(page: 3));
                                widget.pageController.jumpToPage(3);
                              }, state.seletedPage == 3),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.size.maxHeight * .007),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: KCONTANTBLUECOLOR,
                radius: widget.size.maxWidth * .091,
                child: FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        slideTransitionPageRoute(
                            const CartView(),
                            const Offset(1.0, 0.0),
                            Offset.zero,
                            Curves.easeInOut,
                            KCONSTANTDURATION),
                      );
                    },
                    child: SvgPicture.asset(
                      'Assets/Icons/shopping bag.svg',
                      color: KCONSTANTWHITECOLOR,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
