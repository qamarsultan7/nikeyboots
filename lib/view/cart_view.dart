import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Hive/boxes.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/Components/custom_appbar.dart';
import 'package:nikeyboots/Resources/Widgets/totalbill.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/Services/hive.dart';
import 'package:nikeyboots/view/checkout_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView>
    with SingleTickerProviderStateMixin {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  late SlideTransitionController _slideTransition;

  double totalBill = 0.0;
  @override
  void initState() {
    context.read<BillcounterBloc>().add(BillCount());

    _slideTransition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(-1, 0));
    _slideTransition.controller.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      context.read<BillcounterBloc>().add(const UpdateOpacity(opacity: 1));
      _slideTransition.controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Services services = Services(context: context);
    return Scaffold(
      appBar: CustomAppbar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onpress: () {
          context.read<BillcounterBloc>().add(const UpdateOpacity(opacity: 0));
          _slideTransition.controller.reverse().then((value) {
            Navigator.pop(context);
          });
        },
        lefticon: 'Assets/Icons/Arrow.svg',
        rightIcon: const CircleAvatar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: LayoutBuilder(builder: (context, size) {
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              ValueListenableBuilder<Box<CartModel>>(
                  valueListenable: Boxes.getCartData().listenable(),
                  builder: (__, box, _) {
                    if (box.isNotEmpty) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            var data = box.values.toList().cast<CartModel>();
                            totalBill = data[index].price.toDouble();
                            return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 2),
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                height: size.maxHeight * .14,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          FittedBox(
                                            child: Container(
                                              width: size.maxHeight * .12,
                                              height: size.maxHeight * .12,
                                              decoration: BoxDecoration(
                                                  color: KCONSTANTWHITECOLOR,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: SlideTransition(
                                                position:
                                                    _slideTransition.animation,
                                                child: FittedBox(
                                                  child: BlocBuilder<
                                                      BillcounterBloc,
                                                      BillcounterState>(
                                                    builder: (context, state) {
                                                      return AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    700),
                                                        opacity: state.opacity,
                                                        child: Image.asset(
                                                            data[index].img),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.maxWidth * .03,
                                          ),
                                          FittedBox(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.maxWidth * .01,
                                                ),
                                                Text(
                                                  '\$' '${data[index].price}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.maxWidth * .03,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  KCONSTANTWHITECOLOR,
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          int tempCount =
                                                              data[index].count;
                                                          int tempPrice =
                                                              data[index].price;
                                                          if (tempCount > 1) {
                                                            tempCount--;
                                                            tempPrice -= data[
                                                                    index]
                                                                .initialprice;
                                                          }
                                                          services.updateCart(
                                                              data,
                                                              index,
                                                              tempPrice
                                                                  .toDouble(),
                                                              tempCount);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: size.maxWidth *
                                                              .04,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          size.maxWidth * .02,
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .count
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.maxWidth *
                                                                  .04),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          size.maxWidth * .02,
                                                    ),
                                                    FittedBox(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration:
                                                            const BoxDecoration(
                                                                color:
                                                                    KCONTANTBLUECOLOR,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            int tempCount =
                                                                data[index]
                                                                    .count;
                                                            tempCount++;
                                                            data[index].count =
                                                                tempCount;
                                                            double tampprice = data[
                                                                        index]
                                                                    .initialprice *
                                                                tempCount
                                                                    .toDouble();
                                                            services.updateCart(
                                                                data,
                                                                index,
                                                                tampprice
                                                                    .toDouble(),
                                                                tempCount);
                                                          },
                                                          child: Icon(Icons.add,
                                                              size:
                                                                  size.maxWidth *
                                                                      .04),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Size: '),
                                            Text(data[index].size),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            services.deleteItem(data[index]);
                                          },
                                          child: SvgPicture.asset(
                                            'Assets/Icons/delets.svg',
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                          });
                    } else if (box.isEmpty) {
                      return const Center(
                          child: Text(
                        'Nothing is in Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KCONTANTBLUECOLOR),
                      ));
                    } else {
                      return const Text('Something Went wrong');
                    }
                  }),
              BlocBuilder<BillcounterBloc, BillcounterState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state.totalBill == 0 ? false : true,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TotalbillBottom(
                        bill: state.totalBill,
                        buttontitle: 'Checkout',
                        onpress: () {
                          Navigator.push(
                            context,
                            slideTransitionPageRoute(
                              CheckoutView(
                                size: size,
                                totalBill: state.totalBill,
                              ),
                              const Offset(1.0, 0.0),
                              Offset.zero,
                              Curves.easeInOut,
                              const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        size: size,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
