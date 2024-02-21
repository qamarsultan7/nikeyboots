import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/Components/custom_appbar.dart';
import 'package:nikeyboots/Resources/Widgets/product_details.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/view/cart_view.dart';

class ProductDetailsView extends StatefulWidget {
  final String img;
  final int id;
  final String title;
  const ProductDetailsView(
      {Key? key, required this.img, required this.title, required this.id})
      : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView>
    with SingleTickerProviderStateMixin {
  late SlideTransitionController _slideTransition;

  @override
  void initState() {
    _slideTransition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(1, 0));

    Future.delayed(const Duration(milliseconds: 100), () {
      _slideTransition.controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _slideTransition.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
        appBar: CustomAppbar(
          rightIcon: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      slideTransitionPageRoute(
                        const CartView(),
                        const Offset(1.0, 0),
                        Offset.zero,
                        Curves.easeInOut,
                        const Duration(milliseconds: 1200),
                      ));
                },
                child: CircleAvatar(
                  backgroundColor: KCONSTANTWHITECOLOR,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: SizedBox.expand(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                              'Assets/Icons/shopping bag.svg')),
                    ),
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
          title: SizedBox(
            height: constrains.maxWidth * .06,
            child: const FittedBox(
              child: Text(
                'Men\'s Shoes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onpress: () {
            _slideTransition.controller.reverse();
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pop(context);
            });
          },
          lefticon: 'Assets/Icons/Arrow.svg',
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: constrains.maxHeight * .05),
                  height: constrains.maxHeight * .38,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(50),
                          width: constrains.maxWidth * .9,
                          child: FittedBox(
                            child: SlideTransition(
                              position: _slideTransition.animation,
                              child: Image.asset(
                                widget.img,
                              ),
                            ),
                          )),
                      Positioned(
                        bottom: constrains.maxHeight * .05,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                            width: constrains.maxWidth,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SvgPicture.asset(
                                  'Assets/images/arrow_details.svg'),
                            )),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 5),
                    height: constrains.maxHeight * .59,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: KCONSTANTWHITECOLOR,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: ProductDetails(
                      id: widget.id,
                      title: widget.title,
                      img: widget.img,
                      constrains: constrains,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
