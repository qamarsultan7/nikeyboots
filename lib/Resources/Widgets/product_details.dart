import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeyboots/Bloc/Selected/selected_item_bloc.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';

import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/Services/hive.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.img,
    required this.constrains,
    required this.title,
    required this.id,
  });
  final int id;
  final String img;
  final String title;
  final BoxConstraints constrains;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String seletedsize = '\\6';
  @override
  Widget build(BuildContext context) {
    final Services services = Services(context: context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BEST SELLER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.constrains.maxWidth * .04,
                color: KCONTANTBLUECOLOR),
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: widget.constrains.maxWidth * .08,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'Air Jordan is an American Brand of Basketball shoes Shoes Athletic,Casual and style clothing produced by nikee....',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
          ),
          SizedBox(
            height: widget.constrains.maxHeight * .02,
          ),
          Text(
            'Gallery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.constrains.maxWidth * .05,
            ),
          ),
          SizedBox(
            height: widget.constrains.maxHeight * .02,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  3,
                  (index) => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(13)),
                        height: widget.constrains.minHeight * .08,
                        child: Image.asset(widget.img),
                      )),
            ),
          ),
          SizedBox(
            height: widget.constrains.maxHeight * .03,
          ),
          Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.constrains.maxWidth * .05,
            ),
          ),
          BlocBuilder<SelectedItemBloc, SelectedItemState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(2),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    seletedsize = '${40 + index}\\${6 + index}';
                                    context
                                        .read<SelectedItemBloc>()
                                        .add(UpdateShoeSize(selected: index));
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInExpo,
                                    transformAlignment: Alignment.centerLeft,
                                    width: widget.constrains.maxWidth * .2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignInside,
                                            color: state.sletedShoeSize != index
                                                ? Colors.transparent
                                                : Colors.black),
                                        shape: BoxShape.rectangle,
                                        color: index == state.sletedShoeSize
                                            ? KCONTANTBLUECOLOR
                                            : KCONTANTSCAFFOLDCOLOR),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 12),
                                        child: Text(
                                          '${40 + index}\\${6 + index}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  widget.constrains.minHeight *
                                                      .02,
                                              color:
                                                  index == state.sletedShoeSize
                                                      ? KCONSTANTWHITECOLOR
                                                      : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    )),
              );
            },
          ),
          SizedBox(
            height: widget.constrains.maxHeight * .03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                  Text('\$289.5',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
              GestureDetector(
                onTap: () {
                  var data = CartModel(
                      id: widget.id,
                      initialprice: 289,
                      title: widget.title,
                      price: 289,
                      size: seletedsize,
                      img: widget.img,
                      count: 1);
                  services.addToCart(data);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: widget.constrains.maxWidth * .035,
                      horizontal: widget.constrains.maxWidth * .07),
                  decoration: BoxDecoration(
                      color: KCONTANTBLUECOLOR,
                      borderRadius: BorderRadius.circular(60)),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.constrains.maxWidth * .05),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
