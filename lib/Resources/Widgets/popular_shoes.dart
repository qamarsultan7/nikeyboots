import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/Services/hive.dart';
import 'package:nikeyboots/view/product_details_view.dart';

class Popularshoes extends StatefulWidget {
  const Popularshoes({
    super.key,
    required this.size,
  });

  final BoxConstraints size;

  @override
  State<Popularshoes> createState() => _PopularshoesState();
}

class _PopularshoesState extends State<Popularshoes>
    with SingleTickerProviderStateMixin {
  late SlideTransitionController _slideTransition;

  @override
  void initState() {
    _slideTransition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(1, 0));
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideTransition.controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Services service = Services(context: context);
    return Row(
      // scrollDirection: Axis.horizontal,
      children: List.generate(popular_list.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
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
                                            id: index + 111,
                                            title: popular_list[index].title,
                                            img: popular_list[index]
                                                .image
                                                .toString()),
                                        const Offset(1.0, 0),
                                        Offset.zero,
                                        Curves.easeInOut,
                                        KCONSTANTDURATION));
                              },
                              child: SlideTransition(
                                  position: _slideTransition.animation,
                                  child:
                                      Image.asset(popular_list[index].image))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: GestureDetector(
                                onTap: () {
                                  var data = FavItmsModel(
                                      id: 111 + index,
                                      title: popular_list[index].title,
                                      price: 6777,
                                      img: popular_list[index].image);
                                  service.addToFav(data);
                                },
                                child:
                                    SvgPicture.asset('Assets/Icons/heart.svg')),
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
                      popular_list[index].title,
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
          ),
        );
      }),
    );
  }
}
