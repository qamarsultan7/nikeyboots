// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Bloc/NavigationDrawer/home_bloc.dart';
import 'package:nikeyboots/Bloc/bloc/bottom_navigation_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Components/custom_appbar.dart';
import 'package:nikeyboots/Resources/Components/cutom_bottom_bar.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/utils.dart';
import 'package:nikeyboots/view/cart_view.dart';
import 'package:nikeyboots/view/fav_items_view.dart';
import 'package:nikeyboots/view/home__view.dart';
import 'package:nikeyboots/view/notifications_view.dart';
import 'package:nikeyboots/view/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> appbarTitles = [
    appbarTitle(),
    const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          'Favourite',
          key: Key('Favourite'),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
    const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          'Notifications',
          key: Key('Notifications'),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
    const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          'Profile',
          key: Key('profile'),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    )
  ];

  @override
  void initState() {
    context.read<BillcounterBloc>().add(BillCount());
    context.read<BottomNavigationBloc>().add(const ChangePage(page: 0));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return BlocBuilder<NavigationDrawerBloc, NavigationDrawerState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return AnimatedContainer(
            curve: Curves.easeInExpo,
            duration: const Duration(milliseconds: 500),
            transform:
                Matrix4.translationValues(state.offsetX, state.offsetY, 5)
                  ..scale(state.scalefactor)
                  ..translate(.6)
                  ..rotateZ(state.rotate),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(state.sideopen ? 50 : 0.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: CustomAppbar(
                  rightIcon: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: KCONSTANTWHITECOLOR,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SizedBox.expand(
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
                                  'Assets/Icons/shopping bag.svg'),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 2,
                        child: BlocBuilder<BillcounterBloc, BillcounterState>(
                          builder: (context, state) {
                            return Visibility(
                              visible: state.totalBill == 0 ? false : true,
                              child: const CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  title:
                      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                    buildWhen: (previous, current) => current != previous,
                    builder: (context, bottomstate) {
                      return appbarTitles[bottomstate.seletedPage];
                    },
                  ),
                  lefticon: 'Assets/Icons/apps-circle.svg',
                  onpress: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    bool isopen = state.sideopen;
                    if (!isopen) {
                      context.read<NavigationDrawerBloc>().add(
                          SetNavigationDrawer(
                              rotate: -.19,
                              offsetX: 200,
                              offsetY: 90,
                              scalefactor: .9,
                              sideopen: !isopen));
                    } else {
                      context.read<NavigationDrawerBloc>().add(
                          SetNavigationDrawer(
                              rotate: 0,
                              offsetX: 0,
                              offsetY: 0,
                              scalefactor: 1,
                              sideopen: !isopen));
                    }
                  },
                ),
                body: GestureDetector(
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    bool isopen = state.sideopen;
                    if (!isopen) {
                      if (details.delta.dx > 2) {
                        context.read<NavigationDrawerBloc>().add(
                            SetNavigationDrawer(
                                rotate: -.19,
                                offsetX: 200,
                                offsetY: 90,
                                scalefactor: .9,
                                sideopen: !isopen));
                      }
                    } else if (details.delta.dx < -1) {
                      context.read<NavigationDrawerBloc>().add(
                          SetNavigationDrawer(
                              rotate: 0,
                              offsetX: 0,
                              offsetY: 0,
                              scalefactor: 1,
                              sideopen: !isopen));
                    }
                  },
                  child: PageView(
                    controller: Utils.pageController,
                    onPageChanged: (int index) {},
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      HomeeView(constraints: constrains),
                      FavItemsView(
                        size: constrains,
                      ),
                      NotificationsView(
                        size: constrains,
                      ),
                      ProfileView(
                        size: constrains,
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: CustomBottomNavigationBar(
                  size: constrains,
                  pageController: Utils.pageController,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

Widget appbarTitle() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Store Location',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('Assets/Icons/location.svg'),
          const Text(
            'Mondolibug,Sylhet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      )
    ],
  );
}
