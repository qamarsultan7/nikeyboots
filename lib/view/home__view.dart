import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeyboots/Bloc/Selected/selected_item_bloc.dart';
import 'package:nikeyboots/Resources/Animations/page_transition.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/Widgets/headings.dart';
import 'package:nikeyboots/Resources/Widgets/popular_shoes.dart';
import 'package:nikeyboots/Resources/Widgets/catogries.dart';
import 'package:nikeyboots/Resources/Widgets/search_bar.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/view/product_details_view.dart';
import 'package:nikeyboots/view/see_all_products.dart';

class HomeeView extends StatefulWidget {
  final BoxConstraints constraints;
  const HomeeView({Key? key, required this.constraints}) : super(key: key);

  @override
  State<HomeeView> createState() => _HomeeViewState();
}

class _HomeeViewState extends State<HomeeView>
    with SingleTickerProviderStateMixin {
  int isselected = 0;
  late SlideTransitionController _slideTransition;
  @override
  void initState() {
    _slideTransition = SlideTransitionController(
        this, const Duration(milliseconds: 1200), const Offset(1, 0));
    _slideTransition.controller.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideTransition.controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchbar(),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SelectedItemBloc, SelectedItemState>(
              builder: (context, state) {
                return SizedBox(
                  height: widget.constraints.maxHeight * 0.07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories_list.length,
                    itemBuilder: (context, index) {
                      bool selected = index == state.seletedType;
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<SelectedItemBloc>()
                              .add(UpdateSeletedType(selected: index));
                        },
                        child: categories(
                          widget.constraints,
                          selected,
                          categories_list[index].title,
                          categories_list[index].image,
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(
              height: 15,
            ),
            headings(
              onPress: () {
                Navigator.push(
                    context,
                    slideTransitionPageRoute(
                      SeeAllProducts(
                        title: 'Best Seller',
                        size: widget.constraints,
                      ),
                      const Offset(1.0, 0),
                      Offset.zero,
                      Curves.easeInOut,
                      const Duration(milliseconds: 1200),
                    ));
              },
              title: 'Popular Shoes',
            ),
            const SizedBox(
              height: 15,
            ),
            // Popular Shoes
            SizedBox(
              width: double.infinity,
              child: FittedBox(child: Popularshoes(size: widget.constraints)),
            ),
            const SizedBox(
              height: 20,
            ),
            headings(
              onPress: () {},
              title: 'New Arrivals',
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: KCONSTANTWHITECOLOR,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Choice',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: KCONTANTBLUECOLOR),
                      ),
                      Text(
                        'Nike Air Jordan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$5.77',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    width: widget.constraints.maxWidth * .3,
                    child: SlideTransition(
                      position: _slideTransition.animation,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            slideTransitionPageRoute(
                              const ProductDetailsView(
                                id: 888,
                                title: 'Nike Air Jordan',
                                img: 'Assets/images/Nikee/nikee_2.png',
                              ),
                              const Offset(1.0, 0.0),
                              Offset.zero,
                              Curves.easeInOut,
                              const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Image.asset(
                          'Assets/images/Nikee/nikee_2.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
