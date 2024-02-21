import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/utils.dart';
import 'package:nikeyboots/view/product_details_view.dart';

class ItemsGrid extends StatefulWidget {
  final BoxConstraints size;
  final int index;
  final List<FavItmsModel> data;
  const ItemsGrid(
      {Key? key, required this.index, required this.data, required this.size})
      : super(key: key);

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid>
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
                                    id: widget.index + 111,
                                    title: widget.data[widget.index].title,
                                    img: widget.data[widget.index].img
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
                              child: Image.asset(widget.data[widget.index].img),
                            ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: GestureDetector(
                          onTap: () {
                            widget.data[widget.index].delete().then((value) {
                              Utils.showToastMessage('Removed From Fav',
                                  KCONTANTBLUECOLOR, context);
                            });
                          },
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
                 
                  fontWeight: FontWeight.bold,
                  color: KCONTANTBLUECOLOR,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                widget.data[widget.index].title,
                style: const TextStyle(
               
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
                      

                      fontWeight: FontWeight.w700),
                ),
                
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: KCONTANTBLUECOLOR,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  child: const FittedBox(child: Icon(Icons.add)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
