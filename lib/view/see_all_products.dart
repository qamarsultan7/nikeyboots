import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/Components/custom_appbar.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/view/cart_view.dart';
import 'package:nikeyboots/view/product_details_view.dart';

class SeeAllProducts extends StatefulWidget {
  final String title;
  final BoxConstraints size;
  const SeeAllProducts({Key? key, required this.title, required this.size})
      : super(key: key);

  @override
  State<SeeAllProducts> createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts>
    with SingleTickerProviderStateMixin {
  late SlideTransitionController slideTransition;
  @override
  void initState() {
    slideTransition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(-1, 0));
    slideTransition.controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: SvgPicture.asset('Assets/Icons/shopping bag.svg'),
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
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        lefticon: 'Assets/Icons/Arrow.svg',
        onpress: () {
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.pop(context);
          });
        },
      ),
      body: Padding(
        padding: KCONSTANTPADDING,
        child: GridView.builder(
            itemCount: produts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15,
                crossAxisSpacing: 12,
                childAspectRatio: 0.82,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: KCONSTANTWHITECOLOR,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        slideTransitionPageRoute(
                                          ProductDetailsView(
                                              id: produts[index].id + 111,
                                              title: produts[index].title,
                                              img: produts[index]
                                                  .img
                                                  .toString()),
                                          const Offset(1.0, 0),
                                          Offset.zero,
                                          Curves.easeInOut,
                                          const Duration(milliseconds: 1200),
                                        ));
                                  },
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SlideTransition(
                                        position: slideTransition.animation,
                                        child: Image.asset(produts[index].img),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2),
                                child: GestureDetector(
                                    child: SvgPicture.asset(
                                  'Assets/Icons/heart.svg',
                                  color: KCONTANTBLUECOLOR,
                                )),
                              ),
                            ],
                          )),
                      const FittedBox(
                        child: Text(
                          'Best Seller',
                          style: TextStyle(
                            // fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: KCONTANTBLUECOLOR,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          produts[index].title,
                          style: const TextStyle(
                            // fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$9888',
                            style: TextStyle(
                                // fontSize: 15,

                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: widget.size.maxWidth * .2,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: KCONTANTBLUECOLOR,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16))),
                            child: const FittedBox(child: Icon(Icons.add)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
