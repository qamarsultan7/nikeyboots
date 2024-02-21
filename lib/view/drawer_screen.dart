import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeyboots/Bloc/NavigationDrawer/home_bloc.dart';
import 'package:nikeyboots/Bloc/bloc/bottom_navigation_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Components/side_menu_items.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/utils.dart';
import 'package:nikeyboots/view/cart_view.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KCONTANTDRAWERCOLOR,
      body: Container(
        height: double.infinity,
        width: size.width * .6,
        padding: EdgeInsets.only(
            top: size.height * .1,
            left: size.width * .009,
            bottom: size.height * .02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * .5,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage('Assets/images/Profile Pic.jpg'),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    const Text(
                      'Hey, 👋',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 196, 194, 194),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    const FittedBox(
                      child: Text(
                        'QaMaR SulTaN',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: KCONSTANTWHITECOLOR),
                      ),
                    )
                  ],
                ),
              ),
              BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                builder: (context, bottomSatate) {
                  return BlocBuilder<NavigationDrawerBloc,
                      NavigationDrawerState>(
                    builder: (context, drawerSatte) {
                      return SizedBox(
                        height: size.height * .55,
                        child: ListView(
                          children: List.generate(
                              side_menu.length,
                              (index) => SidemenuItems(
                                    size: size,
                                    selected: bottomSatate.seletedPage == index,
                                    onpress: () {
                                      if (index == 4) {
                                        Navigator.push(
                                            context,
                                            slideTransitionPageRoute(
                                              const CartView(),
                                              const Offset(1.0, 0),
                                              Offset.zero,
                                              Curves.easeInOut,
                                              const Duration(
                                                  milliseconds: 1200),
                                            ));
                                      } else {
                                        context
                                            .read<BottomNavigationBloc>()
                                            .add(ChangePage(page: index));
                                        Utils.pageController.jumpToPage(index);
                                      }
                                    },
                                    title: side_menu[index].title,
                                    icon: side_menu[index].image,
                                  )),
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              SidemenuItems(
                  size: size,
                  selected: false,
                  onpress: () {},
                  title: 'Log Out',
                  icon: 'Assets/Icons/Sign Out.svg')
            ],
          ),
        ),
      ),
    );
  }
}
